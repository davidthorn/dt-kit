//
//  FormField.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import Foundation

public typealias FormFieldEventHandler = (String, String?, UIControl.Event) -> Void

public class FormField: RepresentalFactory{

    public var eventHandler: FormFieldEventHandler?
    private var fieldValue: String?
    public let identifier: String
    private let type: FormFieldType
    private lazy var commonTextViewModel: CommonTextFieldViewModel = {
        CommonTextFieldViewModel(identifier: identifier,
                                 value: fieldValue,
                                 isSecure: isSecure,
                                 placeholder: placeholder,
                                 textDidChange: textFieldEventHandler)
    }()
    
    public lazy var viewModel: InputFieldViewModel<CommonTextFieldViewModel> = {
        InputFieldViewModel<CommonTextFieldViewModel>.init(identifier: identifier,
                                                          labelText: labelText,
                                                          textFieldViewModel: commonTextViewModel)
    }()

    public init(identifier: String, type: FormFieldType, handler: FormFieldEventHandler? = nil) {
        self.type = type
        self.identifier = identifier
        eventHandler = handler
    }

    public func create() -> ContainedView {
        fieldValue = value
        let representation = InputFieldRepresentation<InputFieldViewModel<CommonTextFieldViewModel>>(viewModel: viewModel)
        return representation.create()
    }

    public var labelText: NSAttributedString {
        switch type {
        case .email:
            return EMAIL_LABEL.attributed
        case .custom(let label,_,_,_):
            return label
        case .password(_,let confirmation):
            return confirmation ? PASSWORD_REPEAT_LABEL.attributed : PASSWORD_LABEL.attributed
        }
    }

    public var placeholder: NSAttributedString {
        switch type {
        case .email:
            return EMAIL_PLACEHOLDER.attributed
        case .custom(_,_,let placeholderText,_):
            return placeholderText ?? "".attributed
        case .password:
            return PASSWORD_PLACEHOLDER.attributed
        }
    }

    public var isSecure: Bool {
        switch type {
        case .email:
            return false
        case .custom(_,_,_, let isSecure):
            return isSecure
        case .password:
            return true
        }
    }

    public var value: String? {
        switch type {
        case .email(let value):
            return value
        case .custom(_,let value,_,_):
            return value
        case .password(let value,_):
            return value
        }
    }

    private func textFieldEventHandler(value: String?,
                                       commonTextViewModel: CommonTextFieldViewModelProtocol,
                                       event: UIControl.Event) {
        eventHandler?(identifier, value, event)
    }

    public func shouldBecomeFirstResponder() {
        viewModel.shouldBecomeFirstResponder()
    }

}
