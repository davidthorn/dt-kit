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

}
