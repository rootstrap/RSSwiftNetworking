import Foundation

public protocol RailsAPIEndpoint: Endpoint {
  var baseURL: String { get }
  var path: String { get }
}

public extension RailsAPIEndpoint {
  var baseURL: String {
    Bundle.main.object(forInfoDictionaryKey: "Base URL") as? String ?? ""
  }

  var requestURL: URL {
    guard let url = URL(string: baseURL)?.appendingPathComponent(path) else {
      fatalError("URL for endpoint at \(path) could not be constructed")
    }

    return url
  }
}
