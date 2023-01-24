import Foundation

extension JSONDecoder {
  
  public convenience init(decodingConfig: DecodingConfiguration) {
    self.init()
    
    dateDecodingStrategy = decodingConfig.dateStrategy
    keyDecodingStrategy = decodingConfig.keyStrategy
    dataDecodingStrategy = decodingConfig.dataStrategy
  }
  
}
