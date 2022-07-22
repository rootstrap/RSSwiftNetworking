import Foundation

public protocol HeadersProvider {
  var requestHeaders: [String: String] { get }
}

extension Dictionary: HeadersProvider where Key == String, Value == String {

    public var requestHeaders: [String : String] {
        self
    }

}
