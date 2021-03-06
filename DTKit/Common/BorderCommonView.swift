//
//  BorderCommonView.swift
//  RegistrationForm
//
//  Created by Thorn, David on 23.03.20.
//  Copyright © 2020 David Thorn. All rights reserved.
//

import UIKit

public final class BorderCommonView: CommonView {

    override public func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = 5
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 1
    }

}
