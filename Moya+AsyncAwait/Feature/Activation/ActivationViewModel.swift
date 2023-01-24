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

    //@Published var isNavigateToDashboard: Bool = false

    // MARK: - Private

    @Published private(set) var codeInvalid: Bool = true
    @Published private(set) var pinInvalid: Bool = true
//    @Published private(set) var confirmPasswordInvalid: Bool = true

    @Published private(set) var invalid: Bool = true

    private var disposables = [AnyCancellable]()

    //private let userRepository: UserRepository

    // MARK: - Init

    init(
        //userRepository: UserRepository
    ) {
        //self.userRepository = userRepository

        self.$code
            .sink(receiveValue: {
                self.codeInvalid = $0.isEmpty || !$0.isAlphanumeric ? true : false
            })
            .store(in: &self.disposables)

        self.$pin
            .sink(receiveValue: {
                self.pinInvalid = $0.isEmpty
            })
            .store(in: &self.disposables)

        self.$codeInvalid
            .combineLatest(self.$pinInvalid)
            .map {
                return $0 || $1
            }
            .eraseToAnyPublisher()
            .sink(receiveValue: { invalid in
                self.invalid = invalid
            })
            .store(in: &self.disposables)
    }

    // MARK: - Public methods
//
//    func signUp() {
//        Task {
//            do {
//                try await self.userRepository.signUp(email: self.email, password: self.password)
//                DispatchQueue.main.async {
//                    self.isNavigateToDashboard = true
//                }
//            }
//            catch let error {
//                print("[ERROR]: \(error)")
//            }
//        }
//    }
}

