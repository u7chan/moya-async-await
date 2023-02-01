//
//  TestScheduler.swift
//  Moya+AsyncAwaitTests
//
//  Created by unagami on 2023/02/01.
//

import Foundation

final class TestScheduler: SchedulerProtocol {
    func runCatch<T>(
        closure: @escaping () async throws -> T,
        onSuccess: @escaping (T) -> Void,
        onError: @escaping (Error) -> Void
    ) {
        print("Test")
    }
}

