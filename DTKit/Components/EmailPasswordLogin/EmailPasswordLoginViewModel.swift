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

    public var receivedNewCredentials: (EmailPasswordCredentials) -> Void = { _ in }

    public init(email: String?,
                password: String?,
                receivedNewCredentials: ((EmailPasswordCredentials) -> Void)? = nil) {

        self.email = email
        self.password = password
        if let handler = receivedNewCredentials {
            self.receivedNewCredentials = handler
        }
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
