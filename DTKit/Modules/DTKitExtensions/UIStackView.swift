//
//  UIStackView.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//

import UIKit

public extension UIStackView {

    /// Removed all arranged subviews from the stackview
    func removeAllArrangedSubview() {
        arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }

        subviews.forEach {
            $0.removeFromSuperview()
        }

    }

    /// Helper method to add an array or views as arranged views.
    /// - Parameter views: Any array of views.
    func addArrangedSubviews(views: [UIView]) {
        views.forEach { addArrangedSubview($0) }
    }


}
