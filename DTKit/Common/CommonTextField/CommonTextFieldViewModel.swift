//
//  CommonTextFieldViewModel.swift
//  RegistrationForm
//
//  Created by Thorn, David on 23.03.20.
//  Copyright © 2020 David Thorn. All rights reserved.
//

import Foundation

public struct CommonTextFieldViewModel: CommonTextFieldViewModelProtocol & Hashable {

    public var identifier: String
    public var value: String?
    public var isSecure: Bool
    public var placeholder: NSAttributedString
    public var textDidChange: (String?, CommonTextFieldViewModelProtocol) -> Void

    public init(identifier: String,
                value: String?,
                isSecure: Bool,
                placeholder: NSAttributedString,
                textDidChange: @escaping (String?, CommonTextFieldViewModelProtocol) -> Void) {

        self.identifier = identifier
        self.value = value
        self.isSecure = isSecure
        self.placeholder = placeholder
        self.textDidChange = textDidChange
    }


    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
        hasher.combine(value)
        hasher.combine(isSecure)
        hasher.combine(placeholder)
    }

    public static func == (lhs: CommonTextFieldViewModel, rhs: CommonTextFieldViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }

}
