import Foundation

public enum EndpointError: Error {
  case invalidURL
}

/// Base requirements for any network request endpoint.
public protocol Endpoint {

  var requestURL: URL { get }
  var method: Network.HTTPMethod { get }

  var headers: [String: String] { get }
  var parameters: [String: Any] { get }
  var decodingConfiguration: DecodingConfiguration? { get }
  var parameterEncoding: ParameterEncoding { get }

}

public extension Endpoint {

  // MARK: - Defaults

  var decodingConfiguration: DecodingConfiguration? {
    nil
  }

  var parameters: [String: Any] {
    [:]
  }

  var headers: [String: String] {
    [:]
  }

  var parameterEncoding: ParameterEncoding {
    switch method {
    case .patch, .put, .post:
        return .httpBody(.json)
    default:
      return .urlQuery
    }
  }

}
