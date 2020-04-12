//
//  CommonDestructiveButton.swift
//  DTKit
//
//  Created by Thorn, David on 12.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import Foundation

open class CommonDestructiveButton: CommonButton {

    open override func commonInit() {
        positiveState = .destructive
        commonButtonType = .disabled
        super.commonInit()
    }

}
