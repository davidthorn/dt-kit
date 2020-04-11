//
//  FormFieldType.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import Foundation

public enum FormFieldType {
    case custom(label: NSAttributedString,
        value: String?,
        placeholder: NSAttributedString?,
        isSecure: Bool)
    case email(value: String?)
    case password(value: String?, confirmation: Bool)
}
