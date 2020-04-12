//
//  UILabel.swift
//  DTKit
//
//  Created by Thorn, David on 10.04.20.
//

import UIKit

public extension UILabel {

    /// Sets the labels attributed text property using the text and attributes provided
    /// - Parameters:
    ///   - text: The string that should be used for the attributed text
    ///   - attributes: The attributes used for the attrbuted text.
    func setAttributedText(with text: String, with attributes: [NSAttributedString.Key: Any]) {
        attributedText = text.with(attributes: attributes)
    }

    /// Creates a UILabel with the text property set to that of the defaultText
    /// - Parameter defaultText: The value that sets the text property of the label
    convenience init(defaultText: String) {
        self.init()
        text = defaultText
        attributedText = nil
    }

    /// Creates a UILabel with the attributedText property set to that of the defaultAttributed
    /// - Parameter defaultAttributedString: The value that sets the attributedText property of the label
    convenience init(defaultAttributedString: NSAttributedString) {
        self.init()
        text = nil
        attributedText = defaultAttributedString
    }

    /// Creates a left aligned UILabel using the text
    /// - Parameter text: The text that will set the UILabels text property.
    static func leftAligned(with text: String) -> UILabel {
        aligned(with: text, textAlignment: .left)
    }

    /// Creates a right aligned UILabel using the text
    /// - Parameter text: The text that will set the UILabels text property.
    static func rightAligned(with text: String) -> UILabel {
        aligned(with: text, textAlignment: .right)
    }

    /// Creates a center aligned UILabel using the text
    /// - Parameter text: The text that will set the UILabels text property.
    static func centerAligned(with text: String) -> UILabel {
        aligned(with: text, textAlignment: .center)
    }

    /// Creates a left aligned UILabel using the attributedString
    /// - Parameter attributedString: The attributedString that will set the UILabels attributedText property.
    static func leftAligned(with attributedString: NSAttributedString? = nil) -> UILabel {
        aligned(with: attributedString, textAlignment: .left)
    }

    /// Creates a right aligned UILabel using the attributedString
    /// - Parameter attributedString: The attributedString that will set the UILabels attributedText property.
    static func rightAligned(with attributedString: NSAttributedString) -> UILabel {
        aligned(with: attributedString, textAlignment: .right)
    }

    /// Creates a center aligned UILabel using the attributedString
    /// - Parameter attributedString: The attributedString that will set the UILabels attributedText property.
    static func centerAligned(with attributedString: NSAttributedString) -> UILabel {
        aligned(with: attributedString, textAlignment: .center)
    }

    /// Creates an aligned UILabel using the alignment provided
    /// - Parameter text: The text that will set the UILabels text property.
    static func aligned(with text: String, textAlignment: NSTextAlignment) -> UILabel {
        let label = UILabel(defaultText: text)
        label.textAlignment = textAlignment
        return label
    }

    /// Creates an aligned UILabel using the alignment provided
    /// - Parameter attributedString: The text that will set the UILabels text property.
    static func aligned(with attributedString: NSAttributedString? = nil,
                        textAlignment: NSTextAlignment) -> UILabel {

        guard let attributedString = attributedString else { return aligned(textAlignment: textAlignment) }
        let label = UILabel(defaultAttributedString: attributedString)
        label.textAlignment = textAlignment
        return label
    }

    /// Creates an aligned UILabel using the alignment provided
    static func aligned(textAlignment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.textAlignment = textAlignment
        return label
    }

}
