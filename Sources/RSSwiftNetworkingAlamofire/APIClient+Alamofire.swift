//
//  APIClient+Alamofire.swift
//  RSSwiftNetworkingAlamofire
//
//  Created by German on 8/6/22.
//  Copyright © 2022 Rootstrap. All rights reserved.
//

import Foundation
import RSSwiftNetworking

/// Definition for the Alamofire API client provided for prompt use.
public extension BaseAPIClient {
  static let alamofire = BaseAPIClient(
    networkProvider: AlamofireNetworkProvider(),
    headersProvider: [:]
  )
}
