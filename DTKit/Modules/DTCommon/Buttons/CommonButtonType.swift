//
//  CommonButtonType.swift
//  DTKit
//
//  Created by Thorn, David on 12.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import UIKit

public enum CommonButtonType: Hashable {
    case primary
    case secondary
    case disabled
    case common
    case destructive
    case custom(UIColor, UIColor)
}
