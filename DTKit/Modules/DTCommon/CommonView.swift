//
//  CommonView.swift
//  RegistrationForm
//
//  Created by David Thorn on 23.03.20.
//  Copyright © 2020 David Thorn. All rights reserved.
//

import UIKit

open class CommonView: UIView {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    /// Method is called in all constructors.
    /// all worked should be carried out in this method prior to being added to a view.
    open func commonInit() { }

    /// Returns an instance of a CommonView
    public static let common: CommonView = .init()

}
