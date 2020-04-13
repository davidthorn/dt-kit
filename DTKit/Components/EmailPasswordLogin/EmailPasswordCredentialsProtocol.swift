//
//  LoginCredentialsProtocol.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//

import Foundation

public protocol EmailPasswordCredentialsProtocol {
    var email: String { get }
    var password: String { get }
    init(email: String, password: String)
}
