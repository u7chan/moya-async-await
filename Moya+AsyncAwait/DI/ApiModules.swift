//
//  ApiModules.swift
//  Moya+AsyncAwait
//
//  Created by unagami on 2023/01/24.
//

import Foundation

struct ApiModules {
    let activationApi: ActivationApiProtocol

    static func inject(depsModules: MoyaModules) -> ApiModules {
        ApiModules(
            activationApi: ActivationApi(provider: depsModules.activationProvider)
        )
    }
}
