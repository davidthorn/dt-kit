//
//  FormFieldFactory.swift
//  DTRepresentational
//
//  Created by Thorn, David on 12.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import Foundation
import DTForms

extension FormField: RepresentalFactory {

    public func create() -> ContainedView {
        currentValue = value
        switch type {
        case .email:
            return EmailFieldRepresentation<FieldType>(viewModel: viewModel).create()
        case .number:
            return NumberFieldRepresentation<FieldType>(viewModel: viewModel).create()
        default:
            return InputFieldRepresentation<FieldType>(viewModel: viewModel).create()
        }
    }

}




