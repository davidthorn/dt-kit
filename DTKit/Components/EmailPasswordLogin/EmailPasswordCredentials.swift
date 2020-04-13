//
//  LoginCredentials.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//

import Foundation

public struct EmailPasswordCredentials: EmailPasswordCredentialsProtocol, Codable, Hashable {

    public var email: String
    public var password: String

    public static let empty = EmailPasswordCredentials()

    public init() {
        email = ""
        password = ""
    }

    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
