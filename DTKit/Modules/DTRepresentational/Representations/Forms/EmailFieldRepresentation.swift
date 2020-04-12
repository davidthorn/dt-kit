//
//  EmailFieldRepresentation.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//

import Foundation
import DTInputField

public class EmailFieldRepresentation<T: InputFieldRepresentationType & Hashable>: InputFieldRepresentation<T> {

    override public func createField() -> InputField<T> {
        let field = InputField<T>()
        field.keyboardType = .emailAddress
        return field
    }


}
