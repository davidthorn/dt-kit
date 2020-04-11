//
//  LoginViewModelProtocol.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//

import Foundation

public typealias LoginReceivedNewCredentialsHandler = (LoginCredentialsProtocol) -> Void
public typealias LoginViewModelType = Hashable & LoginViewModelProtocol

public protocol LoginViewModelProtocol {
    var email: String? { get }
    var password: String? { get }
    var receivedNewCredentials: (_ credentials: LoginCredentialsProtocol) -> Void { get set }

}
