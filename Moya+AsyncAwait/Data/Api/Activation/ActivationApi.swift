//
//  ActivationApi.swift
//  Moya+AsyncAwait
//
//  Created by unagami on 2023/01/24.
//

import Moya

final class ActivationApi {
    private let provider: MoyaProvider<Activation>

    init(provider: MoyaProvider<Activation>
    ) {
        self.provider = provider
    }
}

// MARK: - ActivationApiProtocol

extension ActivationApi: ActivationApiProtocol {
    func activation(code _: String, pin _: String) async throws {}
}
