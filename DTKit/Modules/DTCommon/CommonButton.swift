//
//  CommonButton.swift
//  DTKit
//
//  Created by Thorn, David on 12.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import UIKit

public typealias VoidCompletion = (CommonButton) -> Void

open class CommonButton: UIButton {

    public static let common: CommonButton = CommonButton(type: .system)
    public static let primary: CommonButton = CommonPrimaryButton(type: .system)
    public static let secondary: CommonButton = CommonSecondaryButton(type: .system)
    public static let disabled: CommonButton = CommonDisabledButton(type: .system)

    private static func button(tapHandler: @escaping VoidCompletion, type: CommonButtonType) -> CommonButton {
        let button =  CommonButton(type: .system)
        button.commonButtonType = type
        button.onTap(handler: tapHandler)
        return button
    }

    public static func common(tapHandler: @escaping VoidCompletion) -> CommonButton {
        button(tapHandler: tapHandler, type: .common)
    }

    public static func primary(tapHandler: @escaping VoidCompletion) -> CommonButton {
        button(tapHandler: tapHandler, type: .primary)
    }

    public static func secondary(tapHandler: @escaping VoidCompletion) -> CommonButton {
        button(tapHandler: tapHandler, type: .secondary)
    }

    public static func disabled(tapHandler: @escaping VoidCompletion) -> CommonButton {
        button(tapHandler: tapHandler, type: .disabled)
    }

    private var onTapHandler: VoidCompletion?

    public var commonButtonType: CommonButtonType = .common {
        didSet {
            applyThemeing()
        }
    }
    private var defaultBackgroundColor: UIColor?
    private var defaultTitleColor: UIColor?

    open func commonInit() {
        height(constant: 44)
        addTarget(self, action: #selector(handleTouchDownEvent), for: .touchDown)
        addTarget(self, action: #selector(handleTouchUpEvent), for: .touchUpInside)
        applyThemeing()
    }

    @objc func handleTouchDownEvent() {
        backgroundColor = defaultBackgroundColor?.withAlphaComponent(0.6)
        setTitleColor(UIColor.black, for: .normal)
    }

    @objc func handleTouchUpEvent() {
        isHighlighted = false
        backgroundColor = defaultBackgroundColor

        setTitleColor(defaultTitleColor, for: .normal)
        
        onTapHandler?(self)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 5
        switch commonButtonType {
        case .common:
            layer.borderColor = UIColor.systemGray.cgColor
            layer.borderWidth = 1
        default:
            layer.borderColor = UIColor.clear.cgColor
            layer.borderWidth = 0
        }
    }

    private func applyThemeing() {
        var controlState: UIControl.State = .normal

        switch commonButtonType {
        case .disabled:
            controlState = .disabled
            defaultTitleColor = UIColor.darkGray
            defaultBackgroundColor = UIColor.lightGray
        case .secondary:
            defaultTitleColor = UIColor.white
            defaultBackgroundColor = UIColor.systemPurple
        case .primary:
            defaultTitleColor = UIColor.white
            defaultBackgroundColor = UIColor.systemBlue
        case .common:
            defaultTitleColor = UIColor.darkGray
            defaultBackgroundColor = UIColor.white
        }

        isEnabled = commonButtonType != .disabled

        backgroundColor = defaultBackgroundColor
        setTitleColor(defaultTitleColor, for: controlState)
    }

    /// Registers a tap handler to be trigger upon the onTouchInside control event is fired.
    /// - Parameter handler: The handle that will be called.
    public func onTap(handler: @escaping VoidCompletion) {
        onTapHandler = handler
    }

}

open class CommonPrimaryButton: CommonButton {

    open override func commonInit() {
        commonButtonType = .primary
        super.commonInit()
    }

}

open class CommonSecondaryButton: CommonButton {

    open override func commonInit() {
        commonButtonType = .secondary
        super.commonInit()
    }

}

open class CommonDisabledButton: CommonButton {

    open override func commonInit() {
        commonButtonType = .disabled
        super.commonInit()
    }

}
