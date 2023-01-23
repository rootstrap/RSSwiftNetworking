import Foundation

/// Concrete implementation of API Client.
public final class BaseAPIClient: APIClient {

  // MARK: - Properties

  private let emptyDataStatusCodes: Set<Int> = [204, 205]

  public private(set) var encodingConfiguration: EncodingConfiguration = .default

  public private(set) var decodingConfiguration: DecodingConfiguration = .default

  private(set) var headersProvider: HeadersProvider = [:]

  private let networkProvider: NetworkProvider

  public required init(networkProvider: NetworkProvider) {
    self.networkProvider = networkProvider
  }

  public convenience init(
    networkProvider: NetworkProvider,
    headersProvider: HeadersProvider,
    encodingConfiguration: EncodingConfiguration = .default,
    decodingConfiguration: DecodingConfiguration = .default
  ) {
    self.init(networkProvider: networkProvider)
    self.encodingConfiguration = encodingConfiguration
    self.decodingConfiguration = decodingConfiguration
    self.headersProvider = headersProvider
  }

  @discardableResult
  public func request<T: Decodable>(
    endpoint: Endpoint,
    completion: @escaping CompletionCallback<T>
  ) -> Cancellable {
    networkProvider.request(
      endpoint: buildAPIEndpoint(from: endpoint)
    ) { [weak self] result in
      guard let self = self else { return }
      
      self.handle(result, for: endpoint, completion: completion)
    }
  }
  
  @discardableResult
    public func requestData(
      endpoint: Endpoint,
      completion: @escaping (Result<Data, Error>) -> Void
    ) -> Cancellable {
      networkProvider.request(
        endpoint: buildAPIEndpoint(from: endpoint)
      ) { result in
        if case .success(let response) = result {
          if let data = response.data {
            completion(.success(data))
          }
        }
      }
    }

  @discardableResult
  public func multipartRequest<T: Decodable>(
    endpoint: Endpoint,
    paramsRootKey: String,
    media: [MultipartMedia],
    completion: @escaping CompletionCallback<T>
  ) -> Cancellable {
    networkProvider.multipartRequest(
      endpoint: buildAPIEndpoint(from: endpoint),
      multipartFormKey: paramsRootKey,
      media: media
    ) { [weak self] result in
      guard let self = self else { return }
      
      self.handle(result, for: endpoint, completion: completion)
    }
  }
  
  private func handle<T: Decodable>(
    _ result: Result<Network.Response, Error>,
    for endpoint: Endpoint,
    completion: CompletionCallback<T>
  ) {
    switch result {
    case .success(let response):
      handle(response, with: endpoint.decodingConfiguration, completion: completion)
    case .failure(let error):
      completion(.failure(error), [:])
    }
  }
  
  private func buildAPIEndpoint(from endpoint: Endpoint) -> APIEndpoint {
    APIEndpoint(endpoint: endpoint, headersProvider: headersProvider)
  }
  
  private func handle<T: Decodable>(
    _ response: Network.Response,
    with configuration: DecodingConfiguration?,
    completion: CompletionCallback<T>
  ) {
    do {
      guard let data = response.data, !data.isEmpty else {
        guard emptyDataStatusCodes.contains(response.statusCode) else {
          throw APIClientError.invalidEmptyResponse
        }
        
        return completion(.success(.none), response.headers)
      }

      completion(.success(try decode(data, with: configuration)), response.headers)
    } catch let error {
      completion(
        .failure(handleCustomAPIError(from: response) ?? error),
        response.headers
      )
    }
  }
  
  private func decode<M: Decodable>(
    _ data: Data,
    with configuration: DecodingConfiguration?
  ) throws -> M {
    let decoder = JSONDecoder(decodingConfig: configuration ?? decodingConfiguration)

    return try decoder.decode(M.self, from: data)
  }
  
  private func handleCustomAPIError(from response: Network.Response) -> APIError? {
      APIError(response: response, decodingConfiguration: decodingConfiguration)
  }
  
}
