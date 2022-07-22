import Foundation

public enum APIClientError: LocalizedError {
    case invalidEmptyResponse
    case statusCodeInvalid
    
    public var domain: ErrorDomain {
        .network
    }

    public var code: Int {
        switch self {
        case .invalidEmptyResponse:
            return 1
        case .statusCodeInvalid:
            return 2
        }
    }

    public var errorDescription: String? {
        switch self {
        case .invalidEmptyResponse:
            return NSLocalizedString("Unexpected empty response", comment: "")
        case .statusCodeInvalid:
            return NSLocalizedString("Status code invalid", comment: "")
        }
    }

}
