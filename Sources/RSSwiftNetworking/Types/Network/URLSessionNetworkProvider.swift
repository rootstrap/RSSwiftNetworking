//
//  URLSessionNetworkProvider.swift
//  RSSwiftNetworking
//
//  Created by German on 8/6/22.
//  Copyright © 2022 Rootstrap. All rights reserved.
//

import Foundation

/// A NetworkProvider implementation that uses `URLSession` APIs.
public final class URLSessionNetworkProvider: NetworkProvider {

    public func request(
        endpoint: Endpoint,
        completion: @escaping (Result<Network.Response, Error>) -> Void
    ) -> Cancellable {
        var request = endpoint.urlRequest
        request.httpBody = try? JSONSerialization.data(withJSONObject: endpoint.parameters, options: .fragmentsAllowed)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse else {
                let error = error ?? Network.ProviderError.noResponse
                completion(.failure(error))
                return
            }

            let providerResponse = Network.Response(
                statusCode: response.statusCode,
                data: data,
                headers: response.allHeaderFields
            )
            completion(.success(providerResponse))
        }

        task.resume()
        return task
    }

    public func multipartRequest(
        endpoint: Endpoint,
        multipartFormKey: String,
        media: [MultipartMedia],
        completion: @escaping (Result<Network.Response, Error>) -> Void
    ) -> Cancellable {
        let uploadTask = URLSession.shared.uploadTask(
            with: endpoint.urlRequest,
            from: media.first!.data
        ) { data, response, error in
            guard let response = response as? HTTPURLResponse else {
                let error = error ?? Network.ProviderError.noResponse
                completion(.failure(error))
                return
            }

            let providerResponse = Network.Response(
                statusCode: response.statusCode,
                data: data,
                headers: response.allHeaderFields
            )
            completion(.success(providerResponse))
        }

        uploadTask.resume()
        return uploadTask
    }

}

extension URLSessionTask: Cancellable {
    public func cancel() -> Self {
        var _: Void = self.cancel()
        return self
    }
}
