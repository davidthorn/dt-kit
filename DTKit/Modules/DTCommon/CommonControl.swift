//
//  CommonControl.swift
//  RegistrationForm
//
//  Created by David Thorn on 23.03.20.
//  Copyright © 2020 David Thorn. All rights reserved.
//

import UIKit

public typealias CommonTapHandler = (CommonControl) -> Void

open class CommonControl: UIControl {

    // MARK: Private Properties

    private(set) var touchUpInsideAction = #selector(onTouchUpInsideSelector)
    private(set) var touchDownAction = #selector(onTouchDownSelector)
    private(set) var tapHandler: CommonTapHandler?

    // MARK: Custom Constructors

    public init(tapHandler: @escaping CommonTapHandler) {
        self.tapHandler = tapHandler
        super.init(frame: .zero)
        commonInit()
    }

    // MARK: Overridden Constructors

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    // MARK: CommonInit - Setup

    open func commonInit() {
        addTarget(
            self,
            action: touchUpInsideAction,
            for: .touchUpInside
        )
        addTarget(
            self,
            action: touchDownAction,
            for: .touchDown
        )
    }


    // MARK: Selectors

    /// Called when the UIControl.Event touchUpInside is triggered.
    @objc private func onTouchUpInsideSelector() {
        onTouchUpInside()
    }

    /// Called when the UIControl.Event touchDown is triggered.
    @objc func onTouchDownSelector() {
        onTouchDown()
    }

    // MARK: Open Methods

    /// Called when UIControl.Event touchUpInside is triggered.
    /// This method also calls the tapHandler
    open func onTouchUpInside() {
        tapHandler?(self)
    }

    /// Called when UIControl.Event touchDown is triggered.
    open func onTouchDown() { }

}
