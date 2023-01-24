//
//  MoyaModules.swift
//  Moya+AsyncAwait
//
//  Created by unagami on 2023/01/24.
//

import Moya

struct MoyaModules {
    let activationProvider: MoyaProvider<Activation>

    static func inject() -> MoyaModules {
        let loggerPluging: PluginType = NetworkLoggerPlugin(
            configuration: .init(logOptions: .verbose)
        )

        #if MOCK
            return MoyaModules(
                activationProvider: MoyaProvider<Activation>(
                    stubClosure: MoyaProvider.immediatelyStub,
                    plugins: [loggerPluging]
                )
            )
        #else
            return MoyaModules(
                activationProvider: MoyaProvider<Activation>(
                    plugins: [loggerPluging]
                )
            )
        #endif
    }
}
