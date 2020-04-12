//
//  FormButtonViewModel.swift
//  RegistrationForm
//
//  Created by David Thorn on 23.03.20.
//  Copyright © 2020 David Thorn. All rights reserved.
//

import Foundation

public struct FormButtonViewModel: FormButtonViewModelProtocol,  Hashable {

    public var identifier: String
    public var labelText: NSAttributedString
    public var tapHandler: () -> Void

    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
        hasher.combine(labelText)
    }

    public static func ==(lhs: FormButtonViewModel , rhs: FormButtonViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
