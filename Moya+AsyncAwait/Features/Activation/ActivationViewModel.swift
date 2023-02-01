//
//  ActivationViewModel.swift
//  Moya+AsyncAwait
//
//  Created by unagami on 2023/01/24.
//

import Combine
import Dispatch

final class ActivationViewModel: ObservableObject {
    // MARK: - Public

    @Published var code: String = ""
    @Published var pin: String = ""
    @Published var historyBack: Bool = false

    // MARK: - Private

    @Published private(set) var codeInvalid: Bool = true
    @Published private(set) var pinInvalid: Bool = true
    @Published private(set) var invalid: Bool = true

    private var disposables = [AnyCancellable]()

    private let scheduler: SchedulerProtocol
    private let activationRepository: ActivationRepositoryProtocol

    // MARK: - Init

    init(
        scheduler: SchedulerProtocol,
        activationRepository: ActivationRepositoryProtocol
    ) {
        self.scheduler = scheduler
        self.activationRepository = activationRepository

        $code
            .sink(receiveValue: {
                self.codeInvalid = $0.isEmpty || !$0.isAlphanumeric ? true : false
            })
            .store(in: &disposables)

        $pin
            .sink(receiveValue: {
                self.pinInvalid = $0.isEmpty
            })
            .store(in: &disposables)

        $codeInvalid
            .combineLatest($pinInvalid)
            .map {
                $0 || $1
            }
            .eraseToAnyPublisher()
            .sink(receiveValue: { invalid in
                self.invalid = invalid
            })
            .store(in: &disposables)
    }

    // MARK: - Public methods

    func activation() {
        scheduler.runCatch {
            try await self.activationRepository.activation(code: self.code, pin: self.pin)
        } onSuccess: { entity in
            print("[Success]: \(entity.origin)")
            self.historyBack = true
        } onError: { error in
            print("[ERROR]: \(error)")
        }
    }
}
