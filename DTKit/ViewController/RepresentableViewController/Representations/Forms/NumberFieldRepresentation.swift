//
//  NumberFieldRepresentation.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//

import Foundation

public final class NumberFieldRepresentation<T: InputFieldRepresentationType & Hashable>: InputFieldRepresentation<T> {

    override public func createField() -> InputField<T> {
        let field = InputField<T>()
        field.keyboardType = .numberPad
        return field
    }

}
