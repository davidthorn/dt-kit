//
//  CommonView.swift
//  RegistrationForm
//
//  Created by David Thorn on 23.03.20.
//  Copyright © 2020 David Thorn. All rights reserved.
//

import UIKit

// A UIView that has a commonInit method that is called in all constructors.
/// The view should be used as the parent of all custom views throughout your applciation
open class CommonView: UIView {

    // MARK: Static Properties

    /// Returns an instance of a CommonView
    public static let common: CommonView = .init()

    // MARK: Overridden Constructors

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    // MARK: CommonInit - Setup

    /// Method is called in all constructors.
    /// all worked should be carried out in this method prior to being added to a view.
    open func commonInit() { }

}
