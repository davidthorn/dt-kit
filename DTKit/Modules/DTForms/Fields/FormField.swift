//
//  FormField.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import UIKit
import DTCommon
import DTInputField
import DTConstants

public typealias FormFieldEventHandler = (String, String?, UIControl.Event) -> Void

public class FormField {

    private var fieldValue: String?

    public var eventHandler: FormFieldEventHandler?
    public var currentValue: String? {
        get { fieldValue }
        set { fieldValue = newValue }
    }

    public let identifier: String
    public let type: FormFieldType
    
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

    public typealias FieldType = InputFieldViewModel<CommonTextFieldViewModel>
    
    public var labelText: NSAttributedString {
        switch type {
        case .email:
            return EMAIL_LABEL.attributed
        case .custom(let label,_,_,_):
            return label
        case .password(_,let confirmation):
            return confirmation ? PASSWORD_REPEAT_LABEL.attributed : PASSWORD_LABEL.attributed
        case .number(let label,_,_):
            return label
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
        case .number(_,_,let placeholderText):
            return placeholderText ?? "".attributed
        }
    }

    public var isSecure: Bool {
        switch type {
        case .email, .number:
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
        case .number(_,let value,_):
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
