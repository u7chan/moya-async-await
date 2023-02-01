//
//  AsyncScheduler.swift
//  Moya+AsyncAwait
//
//  Created by unagami on 2023/02/01.
//

import Foundation

final class AsyncScheduler: SchedulerProtocol {
    func runCatch<T>(
        closure: @escaping () async throws -> T,
        onSuccess: @escaping (T) -> Void,
        onError: @escaping (Error) -> Void
    ) {
        Task {
            do {
                let result = try await closure()
                DispatchQueue.main.async {
                    onSuccess(result)
                }
            } catch {
                DispatchQueue.main.async {
                    onError(error)
                }
            }
        }
    }
}
