//
//  Data+Base64.swift
//  RSSwiftNetworking
//
//  Created by German on 8/6/22.
//  Copyright © 2022 Rootstrap. All rights reserved.
//

import Foundation

// Helper to retrieve the right string value for base64 API uploaders
extension Data {
  func asBase64Param(withType type: MimeType = .jpeg) -> String {
    "data:\(type.rawValue);base64,\(self.base64EncodedString())"
  }
}
