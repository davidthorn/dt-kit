//
//  CommonSecondaryButton.swift
//  DTKit
//
//  Created by Thorn, David on 12.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import Foundation

open class CommonSecondaryButton: CommonButton {

    open override func commonInit() {
        positiveState = .secondary
        commonButtonType = .disabled
        super.commonInit()
    }

}
