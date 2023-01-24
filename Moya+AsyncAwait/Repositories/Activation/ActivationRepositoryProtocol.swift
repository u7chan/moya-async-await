//
//  ActivationRepositoryProtocol.swift
//  Moya+AsyncAwait
//
//  Created by unagami on 2023/01/24.
//

import Foundation

protocol ActivationRepositoryProtocol: AnyObject {
    func activation(code: String, pin: String) async throws
}
