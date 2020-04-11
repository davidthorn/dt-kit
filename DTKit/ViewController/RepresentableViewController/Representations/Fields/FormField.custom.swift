//
//  FormField.custom.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import Foundation

public extension FormField {

    static func custom(identifier: String,
                       value: String?,
                       label: NSAttributedString,
                       placeholder: NSAttributedString?,
                       isSecure: Bool,
                       handler: @escaping FormFieldEventHandler) -> ContainedView {
        custom(identifier: identifier,
               label: label,
               placeholder: placeholder,
               value: value,
               isSecure: isSecure,
               handler: handler).create()
    }

    static func custom(identifier: String,
                       label: NSAttributedString,
                       placeholder: NSAttributedString? = nil,
                       value: String? = nil,
                       isSecure: Bool = false,
                       handler: @escaping FormFieldEventHandler) -> FormField {

        FormField(identifier: identifier, type: .custom(label: label,
                                                        value: value,
                                                        placeholder: placeholder,
                                                        isSecure: isSecure), handler: handler)
    }

}
