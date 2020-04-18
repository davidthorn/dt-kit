//
//  CommonButton.swift
//  DTKit
//
//  Created by Thorn, David on 12.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import UIKit

/// A completion handler that is called when a button has been tapped.
public typealias ButtonTapHandler = (CommonButton) -> Void

/// A button that should be used throughout the application instead of using a UIButton.
open class CommonButton: UIButton {

    // MARK: Public Properties

    public var positiveState: CommonButtonType = .common

    public var commonButtonType: CommonButtonType = .common {
        didSet {
            applyThemeing()
        }
    }

    // MARK: Private Properties

    private(set) var onTapHandler: ButtonTapHandler?
    private(set) var defaultBackgroundColor: UIColor?
    private(set) var defaultTitleColor: UIColor?
    private(set) var handleTouchDownAction = #selector(handleTouchDownEvent)
    private(set) var handleTouchUpAction = #selector(handleTouchUpEvent)

    // MARK: Common Init & Setup

    open func commonInit() {
        height(constant: CommonButton.defaultHeight)
        addTarget(
            self,
            action: handleTouchDownAction,
            for: .touchDown
        )
        addTarget(
            self,
            action: handleTouchUpAction,
            for: .touchUpInside
        )
        applyThemeing()
    }

    // MARK: Selector Methods

    @objc private func handleTouchDownEvent() {
        backgroundColor = defaultBackgroundColor?.withAlphaComponent(0.6)
        setTitleColor(CommonButton.defaultTouchDownTitleColor, for: .normal)
    }

    @objc private func handleTouchUpEvent() {
        isHighlighted = false
        backgroundColor = defaultBackgroundColor

        setTitleColor(defaultTitleColor, for: .normal)
        
        onTapHandler?(self)
    }

    // MARK: Overridden Constructors

    /// Custom constructor
    /// - Parameter buttonType: The button type used to apply theming
    public init(buttonType: CommonButtonType) {
        self.commonButtonType = buttonType
        super.init(frame: .zero)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    // MARK: Lifecycle Methods

    override public func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = CommonButton.defaultCornerRadius
        switch commonButtonType {
        case .common:
            layer.borderColor = CommonButton.defaultBorderColor.cgColor
            layer.borderWidth = CommonButton.defaultBorderWidth
        default:
            layer.borderColor = UIColor.clear.cgColor
            layer.borderWidth = 0
        }
    }

    // MARK: Apply Theming & State

    /// Should apply the positive state property to the commonButtonType
    public func applyPositiveState() {
        commonButtonType = positiveState
    }

    private func applyThemeing() {
        var controlState: UIControl.State = .normal

        switch commonButtonType {
        case .disabled:
            controlState = .disabled
            defaultTitleColor = CommonButton.defaultDisabledTitleColor
            defaultBackgroundColor = CommonButton.defaultDisabledBackgroundColor
        case .secondary:
            defaultTitleColor = CommonButton.defaultSecondaryTitleColor
            defaultBackgroundColor = CommonButton.defaultSecondaryBackgroundColor
        case .primary:
            defaultTitleColor = CommonButton.defaultPrimaryTitleColor
            defaultBackgroundColor = CommonButton.defaultPrimaryBackgroundColor
        case .common:
            defaultTitleColor = CommonButton.defaultCommonTitleColor
            defaultBackgroundColor = CommonButton.defaultCommonBackgroundColor
        case .destructive:
            defaultTitleColor = CommonButton.defaultDestructiveTitleColor
            defaultBackgroundColor =  CommonButton.defaultDestructiveBackgroundColor
        case .custom(let color, let titleColor):
            defaultTitleColor = titleColor
            defaultBackgroundColor =  color
        }

        isEnabled = commonButtonType != .disabled
        backgroundColor = defaultBackgroundColor
        assert(backgroundColor == defaultBackgroundColor)
        setTitleColor(defaultTitleColor, for: controlState)
    }

}

// MARK: CommonButton Default Properties

public extension CommonButton {

    /// The default width used for the views border width
    static let defaultBorderWidth: CGFloat = 1

    /// The default color used for the views border color
    static let defaultBorderColor: UIColor = .systemGray

    /// The default radius used for the views corner radius
    static let defaultCornerRadius: CGFloat = 5

    /// The default height for all common buttons.
    static let defaultHeight: CGFloat = 44

}

// MARK: Default CommonButton Title Colors

public extension CommonButton {

    /// The default title color used for during the touchDown method is being called.
    static let defaultTouchDownTitleColor: UIColor = .black

    /// The default title color used for the commonButtonType of .common
    static let defaultCommonTitleColor: UIColor = .darkGray

    /// The default title color used for the commonButtonType of .disabled
    static let defaultDisabledTitleColor: UIColor = .darkGray

    /// The default title color used for the commonButtonType of .secondary
    static let defaultSecondaryTitleColor: UIColor = .white

    /// The default title color used for the commonButtonType of .primary
    static let defaultPrimaryTitleColor: UIColor = .white

    /// The default title color used for the commonButtonType of .destructive
    static let defaultDestructiveTitleColor: UIColor = .white

}

// MARK: Default CommonButton Background Colors

public extension CommonButton {

    /// The default background color used for the commonButtonType of .common
    static let defaultCommonBackgroundColor: UIColor = .white

     /// The default background color used for the commonButtonType of .disabled
    static let defaultDisabledBackgroundColor: UIColor = .darkGray

    /// The default background color used for the commonButtonType of .secondary
    static let defaultSecondaryBackgroundColor: UIColor = .purple

    /// The default background color used for the commonButtonType of .primary
    static let defaultPrimaryBackgroundColor: UIColor = .blue

     /// The default background color used for the commonButtonType of .destructive
    static let defaultDestructiveBackgroundColor: UIColor = .red

}

// MARK: Public Extension Methods

public extension CommonButton {

    /// Registers a tap handler to be trigger upon the onTouchInside control event is fired.
    /// - Parameter handler: The handle that will be called.
    func onTap(handler: @escaping ButtonTapHandler) {
        onTapHandler = handler
    }

}

// MARK: Static Helper Properties

public extension UIButton {

    /// Returns a CommonButton as a system button with commonButtonType as common
    static let common: CommonButton = .init(buttonType: .common)

    /// Returns a CommonButton as a system button with commonButtonType as primary
    static let primary: CommonButton = .init(buttonType: .primary)

    /// Returns a CommonButton as a system button with commonButtonType as secondary
    static let secondary: CommonButton = .init(buttonType: .secondary)

    /// Returns a CommonButton as a system button with commonButtonType as disabled
    static let disabled: CommonButton = .init(buttonType: .disabled)

    /// Returns a CommonButton as a system button with commonButtonType as destructive
    static let destructive: CommonButton = .init(buttonType: .destructive)

}

// MARK: Static Helper Methods

public extension UIButton {

    /// Creates a Common Button with the state of common.
    /// - Parameter tapHandler: The handler that is called on inTouchInside
    static func common(tapHandler: @escaping ButtonTapHandler) -> CommonButton {
        button(tapHandler: tapHandler, type: .common)
    }

    /// Creates a Common Button with the state of primary.
    /// - Parameter tapHandler: The handler that is called on inTouchInside
    static func primary(tapHandler: @escaping ButtonTapHandler) -> CommonButton {
        button(tapHandler: tapHandler, type: .primary)
    }

    /// Creates a Common Button with the state of second.
    /// - Parameter tapHandler: The handler that is called on inTouchInside
    static func secondary(tapHandler: @escaping ButtonTapHandler) -> CommonButton {
        button(tapHandler: tapHandler, type: .secondary)
    }

    /// Creates a Common Button with the state of disabled.
    /// - Parameter tapHandler: The handler that is called on inTouchInside
    static func disabled(tapHandler: @escaping ButtonTapHandler) -> CommonButton {
        button(tapHandler: tapHandler, type: .disabled)
    }

    /// Creates a Common Button with the state of destructive.
    /// - Parameter tapHandler: The handler that is called on inTouchInside
    static func destructive(tapHandler: @escaping ButtonTapHandler) -> CommonButton {
        button(tapHandler: tapHandler, type: .destructive)
    }

    /// Creates a Custom Common Button
    /// - Parameters:
    ///   - tapHandler: The handler that is called on onTouchInside
    ///   - type: The type of custom button
    private static func button(tapHandler: @escaping ButtonTapHandler, type: CommonButtonType) -> CommonButton {
        let button =  CommonButton(type: .system)
        button.commonButtonType = type
        button.onTap(handler: tapHandler)
        return button
    }

}
