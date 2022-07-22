import Foundation

/// A decoding configuration object used in the request chain
public struct DecodingConfiguration {
  
  public static let `default` = DecodingConfiguration()
  
  let dateStrategy: JSONDecoder.DateDecodingStrategy
  let keyStrategy: JSONDecoder.KeyDecodingStrategy
  let dataStrategy: JSONDecoder.DataDecodingStrategy
  
  init(
    dateStrategy: JSONDecoder.DateDecodingStrategy = .iso8601,
    keyStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
    dataStrategy: JSONDecoder.DataDecodingStrategy = .base64
  ) {
    self.dateStrategy = dateStrategy
    self.keyStrategy = keyStrategy
    self.dataStrategy = dataStrategy
  }
}
