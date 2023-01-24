//
//  ActivationMoyaApi.swift
//  Moya+AsyncAwait
//
//  Created by unagami on 2023/01/24.
//

import Moya

enum ActivationMoyaApi {
    case activation(code: String, pin: String)
}

// MARK: - TargetType

extension ActivationMoyaApi: TargetType {
    var baseURL: URL { URL(string: "https://httpbin.org")! }

    var path: String {
        switch self {
        case .activation:
            return "/post"
        }
    }

    var method: Moya.Method {
        switch self {
        case .activation:
            return .post
        }
    }

    var task: Task {
        switch self {
        case let .activation(code, pin):
            return .requestParameters(
                parameters: ["code": code, "pin": pin],
                encoding: JSONEncoding.default
            )
        }
    }

    var sampleData: Data {
        switch self {
        case let .activation(code, pin):
            print("ActivationMoyaApi#sampleData: \(code), \(pin)")
            return Data()
        }
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
