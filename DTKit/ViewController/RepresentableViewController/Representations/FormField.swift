//
//  FormField.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import Foundation

public class FormField: RepresentalFactory{

    private var fieldValue: String?
    private let identifier: String
    private let type: FormFieldType

    public init(identifier: String, type: FormFieldType) {
        self.type = type
        self.identifier = identifier
    }

    public func create() -> ContainedView {
        fieldValue = value

        let handler: (String?, CommonTextFieldViewModelProtocol) -> Void = { currentValue,_ in
            self.fieldValue = currentValue
        }

        let commonTextViewModel = CommonTextFieldViewModel(identifier: identifier,
                                                           value: fieldValue,
                                                           isSecure: isSecure,
                                                           placeholder: placeholder,
                                                           textDidChange: handler)
        let viewModel = InputFieldViewModel<CommonTextFieldViewModel>.init(identifier: identifier,
                                                                           labelText: labelText,
                                                                           textFieldViewModel: commonTextViewModel)

        let representation = InputFieldRepresentation<InputFieldViewModel<CommonTextFieldViewModel>>(viewModel: viewModel)
        return representation.create()
    }

    private var labelText: NSAttributedString {
        switch type {
        case .email:
            return "Email".with(attributes: [:])
        case .custom(let label,_,_):
            return label
        }
    }

    private var placeholder: NSAttributedString {
        switch type {
        case .email:
            return "Enter your email here".with(attributes: [:])
        case .custom(_,_,let placeholderText):
            return placeholderText ?? "".with(attributes: [:])
        }
    }

    private var isSecure: Bool {
        switch type {
        case .email, .custom:
            return false
        }
    }

    private var value: String? {
        switch type {
        case .email(let value):
            return value
        case .custom(_,let value,_):
            return value
        }
    }

}
