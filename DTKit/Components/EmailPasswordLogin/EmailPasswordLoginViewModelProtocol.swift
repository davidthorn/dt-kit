//
//  EmailPasswordLoginViewModelProtocol.swift
//  DTKit
//
//  Created by Thorn, David on 13.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import Foundation

public typealias ReceivedNewCredentialsHandler = (EmailPasswordCredentialsProtocol) -> Void
public typealias EmailPasswordLoginViewModelType = Hashable & EmailPasswordLoginViewModelProtocol

public protocol EmailPasswordLoginViewModelProtocol {
    associatedtype Credentials: EmailPasswordCredentialsProtocol & Hashable & Codable

    // MARK: UI
    var mainTitle: TextType { get }
    var subtitle: TextType { get }

    // MARK: Default Credentials
    var email: String? { get }
    var password: String? { get }

    // MARK: FormField
//    var formFields: [FormField] { get }

    // MARK: Event Handling
    var receivedNewCredentials: (_ credentials: Credentials) -> Void { get set }

}
