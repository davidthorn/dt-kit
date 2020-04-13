//
//  FAButton.swift
//  DTKit
//
//  Created by Thorn, David on 13.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import UIKit

open class FAButton: UIControl {


    open override func draw(_ rect: CGRect) {

        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.move(to: rect.origin)
    }


}
