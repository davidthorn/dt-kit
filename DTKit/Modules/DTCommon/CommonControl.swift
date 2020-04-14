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

    private var tapHandler: CommonTapHandler?

    public init(tapHandler: @escaping CommonTapHandler) {
        self.tapHandler = tapHandler
        super.init(frame: .zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        addTarget(self, action: #selector(onTouchUpInsideSelector), for: .touchUpInside)
        addTarget(self, action: #selector(onTouchDownSelector), for: .touchDown)
    }

    @objc private func onTouchUpInsideSelector() {
        onTouchUpInside()
    }

    @objc private func onTouchDownSelector() {
        onTouchDown()
    }

    open func commonInit() { }

    open func onTouchUpInside() { }

    open func onTouchDown() {
        tapHandler?(self)
    }

}
