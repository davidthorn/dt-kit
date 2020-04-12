//
//  LoginViewModel.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//

import Foundation

public final class LoginViewModel: LoginViewModelType {

    public var email: String?
    public var password: String?
    public var receivedNewCredentials: LoginReceivedNewCredentialsHandler

    public init(credentials: LoginCredentials, handler: @escaping LoginReceivedNewCredentialsHandler) {
        receivedNewCredentials = handler
        email = credentials.email
        password = credentials.password
    }

    public static func == (lhs: LoginViewModel, rhs: LoginViewModel) -> Bool {
        lhs.hashValue == rhs.hashValue
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(email)
        hasher.combine(password)
    }

}
