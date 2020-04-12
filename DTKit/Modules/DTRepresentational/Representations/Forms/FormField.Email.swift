//
//  FormField.Email.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import Foundation
import DTForms

public extension FormField {

    static func email(identifier: String,
                      value: String?,
                      handler: @escaping FormFieldEventHandler) -> ContainedView {
        email(identifier: identifier,
              value: value, handler:
            handler).create()
    }

    static func email(identifier: String, value: String?, handler: @escaping FormFieldEventHandler) -> FormField {
        FormField(identifier: identifier,
                  type: .email(value: value),
                  handler: handler)
    }

}
