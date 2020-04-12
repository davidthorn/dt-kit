//
//  TextType.swift
//  DTKit
//
//  Created by Thorn, David on 10.04.20.
//

import Foundation

/// Enum used to define the type of text used to provide methods to handle more types.
public enum TextType: Hashable {
    /// Case to handle using just an optional string
    /// - Parameter value: The optional string that should be used.
    case text(value: String?)

    /// Case to handle using just an optional NSAttributedString
    /// - Parameter text: The attributed string that should be used.
    case attributed(text: NSAttributedString?)
}
