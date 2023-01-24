//
//  MoyaModules.swift
//  Moya+AsyncAwait
//
//  Created by unagami on 2023/01/24.
//

import Moya

struct MoyaModule {
    let activationProvider: MoyaProvider<Activation>

    static func inject() -> MoyaModule {
        let loggerPluging: PluginType = NetworkLoggerPlugin(
            configuration: .init(logOptions: .verbose)
        )

        #if MOCK
            return MoyaModule(
                activationProvider: MoyaProvider<Activation>(
                    stubClosure: MoyaProvider.immediatelyStub,
                    plugins: [loggerPluging]
                )
            )
        #else
            return MoyaModule(
                activationProvider: MoyaProvider<Activation>(
                    plugins: [loggerPluging]
                )
            )
        #endif
    }
}
