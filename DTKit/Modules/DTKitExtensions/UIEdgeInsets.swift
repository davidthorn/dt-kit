//
//  UIEdgeInsets.swift
//  BaseProject
//
//  Created by David Thorn on 12.01.20.
//  Copyright © 2020 David Thorn. All rights reserved.
//

import UIKit

public extension UIEdgeInsets {

    /// Creates a UIEdgeInsets using the horizontal values as left / right and the vertical for top / bottom,
    /// - Parameters:
    ///   - horizontal: The value used for left and right
    ///   - vertical: The value used for top and bottom
    init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }

    /// Returns UIEdgeInsets object witin only the left and right properties set to that of the constant.
    /// - Parameter constant: The constant that is used for the left and right property.
    static func horizontal(constant: CGFloat) -> UIEdgeInsets {
        .init(horizontal: constant, vertical: 0)
    }

    /// Default constructor to set all sides to the same value.
    /// - Parameter value: Value used for all insets
    init(value: CGFloat) {
        self.init(top: value, left: value, bottom: value, right: value)
    }
    
}
