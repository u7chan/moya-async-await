//
//  ActivationApi.swift
//  Moya+AsyncAwait
//
//  Created by unagami on 2023/01/24.
//

import Foundation

final class ActivationApi {
    init(
    ) {}
}

// MARK: - ActivationApiProtocol

extension ActivationApi: ActivationApiProtocol {
    func activation(code _: String, pin _: String) async throws {}
}
