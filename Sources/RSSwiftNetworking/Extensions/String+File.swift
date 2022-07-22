//
//  String+File.swift
//  RSSwiftNetworking
//
//  Created by German on 8/6/22.
//  Copyright © 2022 Rootstrap. All rights reserved.
//

import Foundation

extension String {
    var validFilename: String {
      guard !isEmpty else { return "emptyFilename" }
      return addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? "emptyFilename"
    }
}
