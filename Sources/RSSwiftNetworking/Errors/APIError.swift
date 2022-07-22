import Foundation

/// A structure that represents a custom error returned by the API
/// in the request response.
public struct APIError: LocalizedError {
  public let statusCode: Int
  public let underlayingError: RailsError

  public init?(
    response: Network.Response,
    decodingConfiguration: DecodingConfiguration
  ) {
    let decoder = JSONDecoder(decodingConfig: decodingConfiguration)
    guard
      let data = response.data,
      let decodedError = try? decoder.decode(RailsError.self, from: data)
    else {
      return nil
    }

    self.statusCode = response.statusCode
    self.underlayingError = decodedError
  }

  /// Returns the first error returned by the API
  public var firstError: String? {
    if let errors = underlayingError.errors, let firstMessage = errors.first {
        return "\(firstMessage.key) \(firstMessage.value.first ?? "")"
    } else if let errorString = underlayingError.error {
      return errorString
    }

    return nil
  }

  /// Returns an array containing all error values returned from the API
  public var errors: [String] {
    var flattenedErrors = underlayingError.errors?
      .compactMap { $0.value }
      .flatMap { $0 }

    if let errorString = underlayingError.error {
      flattenedErrors?.append(errorString)
    }

    return flattenedErrors ?? []
  }
}

/// A structure that represents a Ruby on Rails API error object
public struct RailsError: Decodable {

  public let errors: [String: [String]]?
  public let error: String?

  enum CodingKeys: String, CodingKey {
    case errors
    case error
  }

  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    if let errors = try? values.decode([String: [String]].self, forKey: .errors) {
      self.errors = errors
      self.error = nil
    } else if let error = try? values.decode(String.self, forKey: .errors) {
      self.error = error
      self.errors = nil
    } else {
      error = try? values.decode(String.self, forKey: .error)
      errors = nil
    }
  }
}
