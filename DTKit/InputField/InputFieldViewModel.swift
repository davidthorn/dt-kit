//
//  InputFieldViewModel.swift
//  RegistrationForm
//
//  Created by David Thorn on 23.03.20.
//  Copyright © 2020 David Thorn. All rights reserved.
//

import Foundation

public struct InputFieldViewModel<T: Hashable & CommonTextFieldViewModelProtocol>: InputFieldViewModelProtocol, Hashable {

    public typealias TextFieldViewModel = T

    public var identifier: String
    public var labelText: NSAttributedString
    public var textFieldViewModel: TextFieldViewModel

    public init(identifier: String, labelText: NSAttributedString, textFieldViewModel: TextFieldViewModel) {
        self.identifier = identifier
        self.labelText = labelText
        self.textFieldViewModel = textFieldViewModel
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
        hasher.combine(labelText)
    }

    public static func ==(lhs: InputFieldViewModel , rhs: InputFieldViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
