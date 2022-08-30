import Foundation

public struct APIEndpoint: Endpoint {

  private let headersProvider: HeadersProvider
  private let endpoint: Endpoint

  init(endpoint: Endpoint, headersProvider: HeadersProvider) {
    self.endpoint = endpoint
    self.headersProvider = headersProvider
  }

  public var requestURL: URL {
    endpoint.requestURL
  }

    public var method: Network.HTTPMethod {
    endpoint.method
  }

  /// Endpoint headers will replace any duplicate from the HeaderProvider.
  public var headers: [String: String] {
      headersProvider.requestHeaders.merging(endpoint.headers) { _, new in new }
  }

  public var parameters: [String: Any] {
    endpoint.parameters
  }

  public var decodingConfiguration: DecodingConfiguration? {
    endpoint.decodingConfiguration
  }

  public var parameterEncoding: ParameterEncoding {
      endpoint.parameterEncoding
  }

}
