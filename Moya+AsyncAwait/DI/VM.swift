//
//  VM.swift
//  Moya+AsyncAwait
//
//  Created by unagami on 2023/01/24.
//

import Foundation

private final class DI {
    // let apiModules: ApiModules
    let repositories: RepositoryModules

    private init() {
        // self.apiModules = ApiModules.inject()
        repositories = RepositoryModules.inject() // depsModules: self.apiModules
    }

    static let shared = DI()
}

enum VM {
    static func createLaunchViewModel() -> ActivationViewModel {
        return ActivationViewModel(activationRepository: DI.shared.repositories.activationRepository)
    }
}
