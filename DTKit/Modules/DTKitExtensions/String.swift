//
//  String.swift
//  DTKit
//
//  Created by Thorn, David on 10.04.20.
//

import UIKit

public extension String {

    /// Returns a NSAttributedString created using this strings value and the attributes.
    /// - Parameter attributes: The attributes that are used for the attributed string.
    func with(attributes: [NSAttributedString.Key: Any]) -> NSAttributedString {
        return .init(string: self, attributes: attributes)
    }

    /// Returns an attributed string with no attributes
    var attributed: NSAttributedString {
        with(attributes: [:])
    }

    var isNotEmpty: Bool {
        !isEmpty
    }

    /// Creates an attributed string using the parameters.
    /// - Parameters:
    ///   - textColor: The color that should be used for the foregroundColor attribute
    ///   - font: The font that should be used for the font attribute
    func with(
        textColor: UIColor? = nil,
        font: UIFont? = nil
    ) -> NSAttributedString  {

        var attributes = [NSAttributedString.Key: Any]()

        if let color = textColor {
            attributes[.foregroundColor] = color
        }

        if let font = font {
            attributes[.font] = font
        }

        return with(attributes: attributes)

    }

}

public extension Optional where Wrapped == String {

    var isNotEmpty: Bool {
        switch self {
        case .none:
            return false
        case .some(let value):
            return value.isNotEmpty
        }
    }

}
