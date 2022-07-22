//
//  Endpoint+URLRequest.swift
//  RSSwiftNetworking
//
//  Created by German on 21/7/22.
//  Copyright © 2022 Rootstrap. All rights reserved.
//

import Foundation

extension Endpoint {

    /// Returns a `URLRequest` object to be executed in a `URLSessionTask`
    var urlRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.name
        request.allHTTPHeaderFields = headers

        return request
    }
}

fileprivate extension Network.HTTPMethod {
    var name: String {
        switch self {
        case .get: return "GET"
        case .delete: return "DELETE"
        case .patch: return "PATCH"
        case .put: return "PUT"
        case .post: return "POST"
        }
    }
}
