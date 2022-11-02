public typealias RequestResponse<T: Decodable> = (
  result: Result<T?, Error>,
  responseHeaders: [AnyHashable: Any]
)

public extension APIClient {

    @discardableResult
    func request<T: Decodable>(endpoint: Endpoint) async -> RequestResponse<T> {
        await withCheckedContinuation { continuation in
            self.request(endpoint: endpoint) { result, responseHeaders in
                continuation.resume(returning: (result, responseHeaders))
            }
        }
    }

    /// Asynchronously performs a multipart request to upload one or many `MultipartMedia` objects.
    /// The endpoint parameters will be encoded in the multipart form.
    /// Note: Multipart requests do not support `Content-Type = application/json` headers.
    /// If your API requires this header user base64 uploads instead.
    @discardableResult
    func multipartRequest<T: Decodable>(
      endpoint: Endpoint,
      paramsRootKey: String,
      media: [MultipartMedia]
    ) async -> RequestResponse<T> {
        await withCheckedContinuation { continuation in
            multipartRequest(
                endpoint: endpoint,
                paramsRootKey: paramsRootKey,
                media: media
            ) { result, responseHeaders in
                continuation.resume(returning: (result, responseHeaders))
            }
        }
    }
}
