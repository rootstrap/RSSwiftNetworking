import Foundation

/// A decoding configuration object used in the request chain
public struct DecodingConfiguration {
  
  public static let `default` = DecodingConfiguration()
  
  public let dateStrategy: JSONDecoder.DateDecodingStrategy
  public let keyStrategy: JSONDecoder.KeyDecodingStrategy
  public let dataStrategy: JSONDecoder.DataDecodingStrategy
  
  public init(
    dateStrategy: JSONDecoder.DateDecodingStrategy = .iso8601,
    keyStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
    dataStrategy: JSONDecoder.DataDecodingStrategy = .base64
  ) {
    self.dateStrategy = dateStrategy
    self.keyStrategy = keyStrategy
    self.dataStrategy = dataStrategy
  }
}
