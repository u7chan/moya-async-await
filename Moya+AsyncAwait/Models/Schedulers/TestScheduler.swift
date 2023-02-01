//
//  TestScheduler.swift
//  Moya+AsyncAwaitTests
//
//  Created by unagami on 2023/02/01.
//

import Foundation
@testable import Moya_AsyncAwait
import XCTest

final class TestScheduler: SchedulerProtocol {
    private let testCase: XCTestCase
    private let timeout: TimeInterval

    init(
        _ testCase: XCTestCase,
        _ timeout: TimeInterval = 10
    ) {
        self.testCase = testCase
        self.timeout = timeout
    }

    func runCatch<T>(
        closure: @escaping () async throws -> T,
        onSuccess: @escaping (T) -> Void,
        onError: @escaping (Error) -> Void
    ) {
        let expectation = testCase.expectation(description: "Timeout")
        Task {
            do {
                let result = try await closure()
                onSuccess(result)
            } catch {
                onError(error)
            }
            expectation.fulfill()
        }
        testCase.waitForExpectations(timeout: timeout)
    }
}
