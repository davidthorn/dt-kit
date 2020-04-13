//
//  EmailPasswordLoginViewModel.swift
//  DTKit
//
//  Created by Thorn, David on 13.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import Foundation

public final class EmailPasswordLoginViewModel: EmailPasswordLoginViewModelType {

    public typealias Credentials = EmailPasswordCredentials

    public var mainTitle: TextType = .attributed(text: "Login".attributed)

    public var subtitle: TextType = .attributed(text: "Subtitle".attributed)

    public var email: String?

    public var password: String?

    public var receivedNewCredentials: (EmailPasswordCredentials) -> Void

    public init(email: String?,
                password: String?,
                receivedNewCredentials: @escaping (EmailPasswordCredentials) -> Void) {

        self.email = email
        self.password = password
        self.receivedNewCredentials = receivedNewCredentials
    }

    public static func == (lhs: EmailPasswordLoginViewModel, rhs: EmailPasswordLoginViewModel) -> Bool {
        lhs.hashValue == rhs.hashValue
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(mainTitle)
        hasher.combine(subtitle)
        hasher.combine(email)
        hasher.combine(password)
    }

}
