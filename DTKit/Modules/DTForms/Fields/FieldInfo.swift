//
//  FieldInfo.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//

import Foundation

/// Information that assists to build a FormField
public struct FieldInfo {

    /// An identifier used to identify this field.
    public let identifier: String

    /// The text displayed within label.
    public let label: NSAttributedString

    /// The initial value that will be displayed in the field.
    public let value: String?

    /// The text that will be displayed as the placeholder in the field.
    public let placeholder: NSAttributedString?

    /// The type of the field.
    public let type: FormFieldType

    /// If the field should use secure text.
    public var isSecure: Bool = false

    /// FormFieldType constructor
    /// - Parameters:
    ///   - identifier: An identifier that assists to recognise this field.
    ///   - type: The type of the field.
    public init(identifier: String, type: FormFieldType) {
        self.identifier = identifier
        self.type = type

        switch type {
        case .custom(let label, let value, let placeholder, let isSecure):
            self.label = label
            self.value = value
            self.placeholder = placeholder
            self.isSecure = isSecure
        case .email(let value):
            label = EMAIL_LABEL.attributed
            self.value = value
            self.placeholder = EMAIL_PLACEHOLDER.attributed
            self.isSecure = false
        case .password(let value, let confirmation):
            label = PASSWORD_LABEL.attributed
            self.value = value
            self.placeholder = confirmation ? PASSWORD_PLACEHOLDER.attributed : PASSWORD_PLACEHOLDER.attributed
            self.isSecure = true
        case .number(let label, let value, let placeholder):
            self.label = label
            self.value = value
            self.placeholder = placeholder
            self.isSecure = false
        case .button(let title,_,_):
            /// TODO: Added attributed string extension to have an empty value.
            label = "".attributed
            isSecure = false
            placeholder = nil
            value = title
        case .primaryButton(let title,_):
        /// TODO: Added attributed string extension to have an empty value.
            label = "".attributed
            isSecure = false
            placeholder = nil
            value = title
        case .destructiveButton(let title,_):
        /// TODO: Added attributed string extension to have an empty value.
            label = "".attributed
            isSecure = false
            placeholder = nil
            value = title
        }
    }

    /// Custom Constructor
    /// - Parameters:
    ///   - identifier: The identifier of the field
    ///   - label: The text of the label
    ///   - value: The initial value to be shown in the field.
    ///   - placeholder: The text to be shown as the placeholder
    ///   - isSecure: If the text value should be visible.
    public init(identifier: String,
                label: NSAttributedString,
                value: String?,
                placeholder: NSAttributedString?,
                isSecure: Bool = false) {

        self.init(identifier: identifier, type: .custom(label: label,
                                                        value: value,
                                                        placeholder: placeholder,
                                                        isSecure: isSecure))
    }
}

public extension FieldInfo {

    static func email(value: String?) -> FieldInfo {
        FieldInfo(identifier: FormFieldName.email,
                  type: .email(value: value))
    }

    static func password(value: String?) -> FieldInfo {
        FieldInfo(identifier: FormFieldName.password,
                  type: .password(value: value,
                                  confirmation: false))
    }

    static func passwordConfirmation(value: String?) -> FieldInfo {
        FieldInfo(identifier: FormFieldName.passwordConfirmation,
                  type: .password(value: value,
                                  confirmation: true))
    }

    static func number(identifier: String, type: FormFieldType) -> FieldInfo {
        FieldInfo(identifier: identifier, type: type)
    }

    /// A Custom Common Button Field Info 
    /// - Parameters:
    ///   - identifier: The identifier used for the button
    ///   - title: The custom title that will be displayed on the buttob
    ///   - type: The type of the button
    ///   - tapHandler: The handler that will be called on onTouchInside.
    static func button(identifier: String,
                       title: String,
                       type: CommonButtonType,
                       tapHandler: @escaping ButtonTapHandler) -> FieldInfo {

        FieldInfo(identifier: identifier,
                  type: .button(title: title,
                                type: type,
                                tapHandler: tapHandler))
    }

    /// A primary common button with the text of SUBMIT_BUTTON_TITLE
    /// - Parameter tapHandler: Handler that will be called on onTouchInside
    static func primaryButton(tapHandler: @escaping ButtonTapHandler) -> FieldInfo {
        .init(identifier: FormFieldName.submitButton,
              type: .primaryButton(title: SUBMIT_BUTTON_TITLE,
                                   tapHandler: tapHandler))
    }

    /// A primary common button with the text of SUBMIT_BUTTON_TITLE
    /// - Parameter tapHandler: Handler that will be called on onTouchInside
    static func submitButton(tapHandler: @escaping ButtonTapHandler) -> FieldInfo {
        .init(identifier: FormFieldName.submitButton,
              type: .button(title: SUBMIT_BUTTON_TITLE,
                            type: .disabled,
                            tapHandler: tapHandler))
    }

    /// A destructive common button with the text of DELETE_BUTTON_TITLE
    /// - Parameter tapHandler: Handler that will be called on onTouchInside
    static func deleteButton(tapHandler: @escaping ButtonTapHandler) -> FieldInfo {
        .init(identifier: FormFieldName.deleteButton,
              type: .destructiveButton(title: DELETE_BUTTON_TITLE, tapHandler: tapHandler))
    }

    /// A primary common button with the text of SAVE_BUTTON_TITLE
    /// - Parameter tapHandler: Handler that will be called on onTouchInside
    static func saveButton(tapHandler: @escaping ButtonTapHandler) -> FieldInfo {
        .init(identifier: FormFieldName.saveButton,
              type: .primaryButton(title: SAVE_BUTTON_TITLE,
                                   tapHandler: tapHandler))
    }

}

public extension Array where Element == FieldInfo {

    var formFields: [FormField] {
        self.map { info in
            FormField(identifier: info.identifier, type: info.type)
        }
    }

}
