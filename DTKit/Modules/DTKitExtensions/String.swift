//
//  String.swift
//  DTKit
//
//  Created by Thorn, David on 10.04.20.
//

import Foundation

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

}
