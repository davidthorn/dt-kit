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

    var string: String? {
        switch self {
        case .attributed(let text):
            return text?.string
        case .text(let value):
            return value
        }
    }

    var identifier: String {
        string ?? UUID().uuidString
    }
}

public extension NSAttributedString {

    var textType: TextType {
        .attributed(text: self)
    }

}

public extension String {

    var textType: TextType {
        .text(value: self)
    }

}
