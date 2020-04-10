//
//  UIEdgeInsets.swift
//  BaseProject
//
//  Created by David Thorn on 12.01.20.
//  Copyright © 2020 David Thorn. All rights reserved.
//

import UIKit

public extension UIEdgeInsets {
    
    init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
    
}
