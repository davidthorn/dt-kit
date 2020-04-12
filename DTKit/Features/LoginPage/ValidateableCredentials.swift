//
//  ValidateableCredentials.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//

import Foundation

public struct ValidateableCredentials<T: LoginCredentialsProtocol>: Hashable {

    private var _email: String?
    public var email: String? {
        get { _email }
        set {

            _email = nil
            
            guard newValue.isNotEmpty else { return }

            _email = newValue
        }
    }

    private var _password: String?
    public var password: String? {
        get { _password }
        set {

            _password = nil

            guard newValue.isNotEmpty else { return }

            _password = newValue
        }
    }

    private struct Credentials: Encodable, Hashable {
        var email: String?
        var password: String?

        func isValid() -> LoginCredentialsProtocol? {
            do {
                let encoded = try JSONEncoder().encode(self)
                return try JSONDecoder().decode(LoginCredentials.self, from: encoded)
            } catch {
                return nil
            }
        }
    }

    public func validate() -> LoginCredentialsProtocol? {
        let credentials = Credentials(email: email, password: password)
        return credentials.isValid()
    }

    public static func == (lhs: ValidateableCredentials<T>, rhs: ValidateableCredentials<T>) -> Bool {
        lhs.hashValue == rhs.hashValue
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(email)
        hasher.combine(password)
    }
}
