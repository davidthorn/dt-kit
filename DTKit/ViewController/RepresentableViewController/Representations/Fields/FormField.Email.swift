//
//  FormField.Email.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import Foundation

public extension FormField {

    static func email(identifier: String, value: String?) -> ContainedView {
        email(identifier: identifier, value: value).create()
    }

    static func email(identifier: String, value: String?) -> FormField {
        FormField(identifier: identifier, type: .email(value: value))
    }

}
