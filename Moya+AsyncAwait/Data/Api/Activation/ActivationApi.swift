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
    func activation(code: String, pin: String) async throws -> ActivationEntity {
        let result = await provider
            .requestAsync(.activation(code: code, pin: pin))
            .filterSuccessfulStatusCodes()
            .map(ActivationEntity.self)
        switch result {
        case let .success(data):
            print("#success: \(data)")
            return data
        case let .failure(error):
            print("#error: \(error)")
            throw error
        }
    }
}
