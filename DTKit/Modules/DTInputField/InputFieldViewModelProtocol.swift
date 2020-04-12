//
//  InputFieldViewModelProtocol.swift
//  RegistrationForm
//
//  Created by David Thorn on 23.03.20.
//  Copyright © 2020 David Thorn. All rights reserved.
//

import Foundation
import DTCommon

public protocol InputFieldViewModelProtocol {
    associatedtype TextFieldViewModel: Hashable & CommonTextFieldViewModelProtocol
    var identifier: String { get }
    var labelText: NSAttributedString { get }
    var textFieldViewModel: TextFieldViewModel { get }
    var shouldBecomeFirstResponder: () -> Void { get set }
    var shouldResignFirstResponder: () -> Void { get set }
}
