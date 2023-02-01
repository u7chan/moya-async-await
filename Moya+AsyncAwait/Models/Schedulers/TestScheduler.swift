//
//  TestScheduler.swift
//  Moya+AsyncAwaitTests
//
//  Created by unagami on 2023/02/01.
//

import Foundation

final class TestScheduler: SchedulerProtocol {
    func runCatch<T>(
        closure _: @escaping () async throws -> T,
        onSuccess _: @escaping (T) -> Void,
        onError _: @escaping (Error) -> Void
    ) {
        print("Test")
    }
}
