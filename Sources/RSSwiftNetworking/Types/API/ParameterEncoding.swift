//
//  ParameterEncoding.swift
//  RSSwiftNetworking
//
//  Created by German on 30/8/22.
//

import Foundation

/// The different ways to encode HTTP request paramenters
public enum ParameterEncoding {
    /// The parameters are encoded in the HTTP request body.
    case httpBody(HTTPBodyEncoding)

    /// The parameters are encoded in a query string into the request URL.
    case urlQuery
}

/// The formats available for the parameters encoded in the HTTP request body
public enum HTTPBodyEncoding {
    /// The parameters are sent in JSON format.
    case json
    /// The parameters are sent as-is, encoded in a Data object.
    case plain
}
