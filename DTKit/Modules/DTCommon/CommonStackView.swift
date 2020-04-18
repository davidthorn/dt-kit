//
//  CommonStackView.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//

import UIKit

open class CommonStackView: UIStackView {

    // MARK: Overridden Constructors

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    // MARK: Common Init & Setup

    open func commonInit() { }

}

// MARK: Default Static Properties

public extension CommonStackView {

    /// The default distribution applied to a vertical common stack view
    static let defaultVerticalDistribution: UIStackView.Distribution = .fillProportionally

    /// The default distribution applied to a horizontal common stack view
    static let defaultHorizontalDistribution: UIStackView.Distribution = .fillProportionally

    /// The default alignment applied to a vertical common stack view
    static let defaultVerticalAlignment: UIStackView.Alignment  = .fill

    /// The default alignment applied to a horizontal common stack view
    static let defaultHorizontalAlignment: UIStackView.Alignment  = .leading

    /// The default spacing applied to a vertical common stack view
    static let defaultVerticalSpacing: CGFloat = 0

    /// The default spacing applied to a horizontal common stack view
    static let defaultHorizontalSpacing: CGFloat = 8

}

// MARK: Extension - Static Helper Properties

public extension UIStackView {

    /// Returns a CommonStackView with a axis of vertical
    static var vertical: CommonStackView {
        let stackView = CommonStackView()
        stackView.axis = .vertical
        stackView.distribution = CommonStackView.defaultVerticalDistribution
        stackView.spacing = CommonStackView.defaultVerticalSpacing
        return stackView
    }

    static var horizontal: CommonStackView {
        let stackView = CommonStackView()
        stackView.axis = .horizontal
        stackView.distribution = CommonStackView.defaultHorizontalDistribution
        stackView.alignment = CommonStackView.defaultHorizontalAlignment
        stackView.spacing = CommonStackView.defaultHorizontalSpacing
        return stackView
    }

}
