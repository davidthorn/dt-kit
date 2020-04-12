//
//  CommonStackView.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//

import UIKit

open class CommonStackView: UIStackView {

    public func commonInit() { }

    public static var vertical: CommonStackView {
        let stackView = CommonStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }
}
