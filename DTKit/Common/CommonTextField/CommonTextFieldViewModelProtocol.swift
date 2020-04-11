//
//  CommonTextFieldViewModelProtocol.swift
//  RegistrationForm
//
//  Created by Thorn, David on 23.03.20.
//  Copyright © 2020 David Thorn. All rights reserved.
//

import Foundation

public typealias CommonTextFieldEventHandler = (String?, CommonTextFieldViewModelProtocol, UIControl.Event) -> Void

public protocol CommonTextFieldViewModelProtocol {
    var identifier: String { get }
    var value: String? { get }
    var isSecure: Bool { get }
    var placeholder: NSAttributedString { get }
    var textDidChange: CommonTextFieldEventHandler { get set }

    init(identifier: String,
         value: String?,
         isSecure: Bool,
         placeholder: NSAttributedString,
         textDidChange: @escaping CommonTextFieldEventHandler)
}
