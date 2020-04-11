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
                       placeholder: NSAttributedString?) -> ContainedView {

        FormField(identifier: identifier, type: .custom(label: label,
                                                        value: value,
                                                        placeholder: placeholder)).create()
    }

}
