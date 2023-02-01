//
//  ActivationViewModelTest.swift
//  Moya+AsyncAwaitTests
//
//  Created by unagami on 2023/02/01.
//

@testable import Moya_AsyncAwait
import XCTest

private final class ActivationRepositoryMock: ActivationRepositoryProtocol {
    private(set) var activationCallCount = 0
    var activationHandler: ((String, String) async throws -> (ActivationEntity))?
    func activation(code: String, pin: String) async throws -> ActivationEntity {
        activationCallCount += 1
        if let activationHandler = activationHandler {
            return try await activationHandler(code, pin)
        }
        fatalError("Not return value")
    }
}

final class ActivationViewModelTest: XCTestCase {
    private var activationRepository: ActivationRepositoryMock!
    private var viewModel: ActivationViewModel!

    override func setUpWithError() throws {
        activationRepository = ActivationRepositoryMock()
        viewModel = ActivationViewModel(
            scheduler: TestScheduler(self),
            activationRepository: activationRepository
        )
    }

    func test_activation() throws {
        // When
        activationRepository.activationHandler = { pin, code in
            print("pin: \(pin), code: \(code)")
            return ActivationEntity(origin: "#Dummy")
        }

        // Given
        viewModel.activation()

        // Then
        XCTAssertEqual(1, activationRepository.activationCallCount)
    }
}
