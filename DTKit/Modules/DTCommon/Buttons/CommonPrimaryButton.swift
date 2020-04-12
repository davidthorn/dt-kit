//
//  CommonPrimaryButton.swift
//  DTKit
//
//  Created by Thorn, David on 12.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import Foundation

open class CommonPrimaryButton: CommonButton {

    open override func commonInit() {
        positiveState = .primary
        commonButtonType = .disabled
        super.commonInit()
    }

}
