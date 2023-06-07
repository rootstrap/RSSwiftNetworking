//
//  Base64Media.swift
//  ios-base
//
//  Created by German on 7/7/17.
//  Copyright © 2017 Rootstrap Inc. All rights reserved.
//

import Foundation

public class Base64Media: MultipartMedia {
  var base64: String
  
  override public init(fileName: String, key: String, data: Data, type: MimeType = .jpeg) {
    self.base64 = data.asBase64Param(withType: type)
    super.init(fileName: fileName, key: key, data: data, type: type)
  }
}
