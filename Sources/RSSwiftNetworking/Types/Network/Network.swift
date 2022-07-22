import Foundation

/// Namespace enclosing common types of the API
public enum Network {

  // MARK: - Types

  /// Defines the HTTP methods used by the API
  public enum HTTPMethod {
    case get
    case post
    case put
    case patch
    case delete
  }

  /// Meaningful HTTP status codes for the API.
  public enum StatusCode {
    static let unauthorized = 401
  }

  /// Represents an APIClient response
  public struct Response {

    /// The HTTP status code of the response
    public let statusCode: Int

    /// The associated response `Data`, if any
    public let data: Data?

    // The headers included in the response
    public let headers: [AnyHashable: Any]

    public init(statusCode: Int, data: Data?, headers: [AnyHashable: Any]) {
      self.statusCode = statusCode
      self.data = data
      self.headers = headers
    }
  }

  /// Empty structure that represents an empty network response
  public struct EmptyResponse: Decodable {}

  /// Defines the possible internal errors for a `NetworkProvider`
  public enum ProviderError: Error {
    case noResponse
  }

  /// Defines the Content Types to be used in HTTP requests
  public enum ContentType {
    static let plainText = "text/plain"
    static let applicationURLForm = "application/x-www-form-urlencoded"
    static let applicationJSON = "application/json"
    static let applicationXML = "application/xml"
    static let multipartForm = "multipart/form-data"
  }

}
