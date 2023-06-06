//
//  MultipartMedia.swift
//  ios-base
//
//  Created by German on 7/7/17.
//  Copyright © 2017 Rootstrap Inc. All rights reserved.
//

import Foundation

// Basic media MIME types, add more if needed.
public enum MimeType {
  case jpeg
  case bmp
  case png
  case mov
  case mpeg
  case avi
  case json
  case custom(contentType: String, extension: String)
  
  public var contentType: String {
    switch self {
    case .jpeg:
      return "image/jpeg"
    case .bmp:
      return "image/bmp"
    case .png:
      return "image/png"
    case .mov:
      return "video/quicktime"
    case .mpeg:
      return "video/mpeg"
    case .avi:
      return "video/avi"
    case .json:
      return "application/json"
    case .custom(let contentType, _):
      return contentType
    }
  }
  
  public var fileExtension: String {
    switch self {
    case .jpeg:
      return ".jpg"
    case .bmp:
      return ".bmp"
    case .png:
      return ".png"
    case .mov:
      return ".mov"
    case .mpeg:
      return ".mpeg"
    case .avi:
      return ".avi"
    case .json:
      return ".json"
    case .custom( _, let fileExtension):
      return fileExtension
    }
  }
}

public class MultipartMedia {
  public var key: String // key name to send file
  public var fileName: String // file name
  public var data: Data
  public var type: MimeType

  public var toFile: String {
    fileName.validFilename + type.fileExtension
  }
  
  public init(fileName: String, key: String, data: Data, type: MimeType = .jpeg) {
    self.key = key
    self.data = data
    self.type = type
    self.fileName = fileName
  }
}
