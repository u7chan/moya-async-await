//
//  RepositoryModules.swift
//  Moya+AsyncAwait
//
//  Created by unagami on 2023/01/24.
//

import Foundation

struct RepositoryModules {
    let activationRepository: ActivationRepositoryProtocol

    static func inject(depsModules: ApiModules) -> RepositoryModules {
        RepositoryModules(
            activationRepository: ActivationRepository(activationApi: depsModules.activationApi)
        )
    }
}
