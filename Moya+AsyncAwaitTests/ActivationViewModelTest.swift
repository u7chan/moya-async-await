//
//  ActivationViewModelTest.swift
//  Moya+AsyncAwaitTests
//
//  Created by unagami on 2023/02/01.
//

@testable import Moya_AsyncAwait
import XCTest

private final class ActivationRepositoryMock: ActivationRepositoryProtocol {
    func activation(code _: String, pin _: String) async throws -> ActivationEntity {
        print("# Call by Mock")
        return ActivationEntity(origin: "DUMMY")
    }
}

final class ActivationViewModelTest: XCTestCase {
    private var viewModel: ActivationViewModel!

    override func setUpWithError() throws {
        viewModel = ActivationViewModel(
            scheduler: TestScheduler(self),
            activationRepository: ActivationRepositoryMock()
        )
    }

    func test_activation() throws {
        // When
        // Given
        viewModel.activation()
        // Then
    }
}
