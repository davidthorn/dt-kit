//
//  BorderCommonView.swift
//  RegistrationForm
//
//  Created by Thorn, David on 23.03.20.
//  Copyright © 2020 David Thorn. All rights reserved.
//

import UIKit

public final class BorderCommonView: CommonView {

    // MARK: Private Properties

    private(set) var _borderColor: UIColor = BorderCommonView.defaultBorderColor
    private(set) var _borderWidth: CGFloat = BorderCommonView.defaultBorderWidth
    private(set) var _cornerRadius: CGFloat = BorderCommonView.defaultCornerRadius

    // MARK: View LifeCycle Events

    override public func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = _cornerRadius
        layer.borderColor = _borderColor.cgColor
        layer.borderWidth = _borderWidth
    }

}

// MARK: Static Default Properties

public extension BorderCommonView {

    /// The default corner radius used for all BorderedViews
    static let defaultCornerRadius: CGFloat = 5

    /// The default border color used for all BorderedViews
    static let defaultBorderColor: UIColor = UIColor.darkGray.withAlphaComponent(0.4)

    /// The default border width used for all BorderedViews
    static let defaultBorderWidth:CGFloat = 1

}

// MARK: Public Interface Computed Properties

public extension BorderCommonView {

    /// Gets and Sets the BorderCommonViews layers border color property
    var borderColor: UIColor {
        get { _borderColor }
        set {
            _borderColor = newValue
            layer.borderColor = _borderColor.cgColor
        }
    }

    /// Gets and Sets the BorderCommonViews layers border width property
    var borderWidth: CGFloat {
        get { _borderWidth }
        set {
            _borderWidth = newValue
            layer.borderWidth = _borderWidth
        }
    }

    /// Gets and Sets the BorderCommonViews layers corner radius property
    var cornerRadius: CGFloat {
        get { _cornerRadius }
        set {
            _cornerRadius = newValue
            layer.cornerRadius = _cornerRadius
        }
    }

}

// MARK: Public Interface Static Methods

public extension BorderCommonView {

    /// Returns a BorderCommonView with custom settings.
    /// - Parameters:
    ///   - borderColor: The border color applied to the layers border color property
    ///   - borderWidth: The border width applied to the layers border width property
    ///   - cornerRadius: The value applied to the layers corner radius property.
    static func borderedView(
        borderColor: UIColor = BorderCommonView.defaultBorderColor,
        borderWidth: CGFloat = BorderCommonView.defaultBorderWidth,
        cornerRadius: CGFloat = BorderCommonView.defaultCornerRadius
    ) -> BorderCommonView {
        let view: BorderCommonView = .init()
        view.borderColor = borderColor
        view.borderWidth = borderWidth
        view.cornerRadius = cornerRadius
        return view
    }

}
