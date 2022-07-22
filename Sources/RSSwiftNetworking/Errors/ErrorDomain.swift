import Foundation

public enum ErrorDomain: String {
  case network = "NetworkError"

  var name: String {
    return [Bundle.main.bundleIdentifier, rawValue]
      .compactMap { $0 }
      .joined(separator: ".")
  }
}
