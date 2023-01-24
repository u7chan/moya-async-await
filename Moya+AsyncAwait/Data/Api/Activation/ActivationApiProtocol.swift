//
//  ActivationApiProtocol.swift
//  Moya+AsyncAwait
//
//  Created by unagami on 2023/01/24.
//

import Foundation

protocol ActivationApiProtocol: AnyObject {
    func activation(code: String, pin: String) async throws
}
