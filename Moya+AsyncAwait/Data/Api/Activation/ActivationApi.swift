//
//  ActivationApi.swift
//  Moya+AsyncAwait
//
//  Created by unagami on 2023/01/24.
//

import Moya

final class ActivationApi {
    private let provider: MoyaProvider<Activation>

    init(provider: MoyaProvider<Activation>) {
        self.provider = provider
    }
}

// MARK: - ActivationApiProtocol

extension ActivationApi: ActivationApiProtocol {
    func activation(code: String, pin: String) async throws {
        provider.request(.activation(code: code, pin: pin), completion: { result in
            switch result {
            case let .success(response):
                print("response: \(response)")
            case let .failure(error):
                print("error: \(error)")
            }
        })
    }
}
