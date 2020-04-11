//
//  FormFieldType.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import Foundation

public enum FormFieldType {
    case custom(label: NSAttributedString, value: String?, placeholder: NSAttributedString?)
    case email(value: String?)
}
