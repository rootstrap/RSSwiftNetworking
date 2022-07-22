//
//  MultipartMedia.swift
//  ios-base
//
//  Created by German on 7/7/17.
//  Copyright © 2017 Rootstrap Inc. All rights reserved.
//

import Foundation

// Basic media MIME types, add more if needed.
public enum MimeType: String {
  case jpeg = "image/jpeg"
  case bmp = "image/bmp"
  case png = "image/png"
  
  case mov = "video/quicktime"
  case mpeg = "video/mpeg"
  case avi = "video/avi"
  case json = "application/json"
  
  func fileExtension() -> String {
    switch self {
    case .bmp: return ".bmp"
    case .png: return ".png"
    case .mov: return ".mov"
    case .mpeg: return ".mpeg"
    case .avi: return ".avi"
    case .json: return ".json"
    default: return ".jpg"
    }
  }
}

public class MultipartMedia {
  public var key: String
  public var data: Data
  public var type: MimeType

  public var toFile: String {
    key.validFilename + type.fileExtension()
  }
  
  public init(key: String, data: Data, type: MimeType = .jpeg) {
    self.key = key
    self.data = data
    self.type = type
  }
}
