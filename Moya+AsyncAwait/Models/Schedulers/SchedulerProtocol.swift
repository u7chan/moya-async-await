//
//  SchedulerProtocol.swift
//  Moya+AsyncAwait
//
//  Created by unagami on 2023/02/01.
//

import Foundation

protocol SchedulerProtocol {
    func runCatch<T>(
        closure: @escaping () async throws -> T,
        onSuccess: @escaping (T) -> Void,
        onError: @escaping (Error) -> Void
    )
}
