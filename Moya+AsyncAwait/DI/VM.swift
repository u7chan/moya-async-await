//
//  VM.swift
//  Moya+AsyncAwait
//
//  Created by unagami on 2023/01/24.
//

import Foundation

struct VM {
    static func createLaunchViewModel() -> ActivationViewModel {
        return ActivationViewModel(
            scheduler: AsyncScheduler(),
            activationRepository: DI.shared.repositoryModules.activationRepository
        )
    }
}

private final class DI {
    static let shared = DI()

    let repositoryModules: RepositoryModules

    private let moyaModules: MoyaModules
    private let apiModules: ApiModules

    private init() {
        moyaModules = MoyaModules.inject()
        apiModules = ApiModules.inject(depsModules: moyaModules)
        repositoryModules = RepositoryModules.inject(depsModules: apiModules)
    }
}
