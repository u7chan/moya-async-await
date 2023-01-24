//
//  ActivationRepository.swift
//  Moya+AsyncAwait
//
//  Created by unagami on 2023/01/24.
//

import Foundation

final class ActivationRepository {
    private let activationApi: ActivationApiProtocol

    init(activationApi: ActivationApiProtocol) {
        self.activationApi = activationApi
    }
}

// MARK: - ActivationRepositoryProtocol

extension ActivationRepository: ActivationRepositoryProtocol {
    func activation(code: String, pin: String) async throws -> ActivationEntity {
        return try await activationApi.activation(code: code, pin: pin)
    }
}
