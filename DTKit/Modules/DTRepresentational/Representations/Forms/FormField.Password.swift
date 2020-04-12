//
//  FormField.Password.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//

import Foundation
import DTForms

public extension FormField {

    static func password(identifier: String,
                         value: String?,
                         handler: @escaping FormFieldEventHandler) -> ContainedView {
        password(identifier: identifier,
                 value: value,
                 handler: handler).create()
    }

    static func password(identifier: String, value: String?, handler: @escaping FormFieldEventHandler) -> FormField {
        FormField(identifier: identifier,
                  type: .password(value: value, confirmation: false),
                  handler: handler)
    }

    static func confirmationPassword(identifier: String,
                                     value: String?,
                                     handler: @escaping FormFieldEventHandler) -> ContainedView {
        confirmationPassword(identifier: identifier,
                             value: value,
                             handler: handler).create()
    }

    static func confirmationPassword(identifier: String, value: String?, handler: @escaping FormFieldEventHandler) -> FormField {
        FormField(identifier: identifier,
                  type: .password(value: value, confirmation: true),
                  handler: handler)
    }

}
