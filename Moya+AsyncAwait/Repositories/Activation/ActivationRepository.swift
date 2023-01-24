//
//  ActivationRepository.swift
//  Moya+AsyncAwait
//
//  Created by unagami on 2023/01/24.
//

import Foundation

final class ActivationRepository {
    // private let loginApi: LoginApiProtocol

    init(
    ) {}
}

// MARK: - ActivationRepositoryProtocol

extension ActivationRepository: ActivationRepositoryProtocol {
    func activation(code: String, pin: String) async throws {
        // TODO:
        print("code: \(code), pin: \(pin)")
    }
}
