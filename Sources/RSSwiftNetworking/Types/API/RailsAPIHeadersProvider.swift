import Foundation

public protocol SessionProvider {
    var uid: String? { get }
    var client: String? { get }
    var accessToken: String? { get }
}

open class RailsAPIHeadersProvider: HeadersProvider {

  private let sessionProvider: SessionProvider

  private let contentTypeJSON = Network.ContentType.applicationJSON

  private var contentTypeHeaders: [String: String] {
    [
      HTTPHeader.accept.rawValue: contentTypeJSON,
      HTTPHeader.contentType.rawValue: contentTypeJSON
    ]
  }

  public var requestHeaders: [String: String] {
    contentTypeHeaders.merging(sessionProvider.headers) { current, _ in current }
  }

  public init(sessionProvider: SessionProvider) {
    self.sessionProvider = sessionProvider
  }

}

private extension SessionProvider {
  var headers: [String: String] {
    var headers: [String: String] = [:]

    if let uid = uid {
      headers[HTTPHeader.uid.rawValue] = uid
    }
    if let client = client {
      headers[HTTPHeader.client.rawValue] = client
    }
    if let token = accessToken {
      headers[HTTPHeader.token.rawValue] = token
    }

    return headers
  }
}
