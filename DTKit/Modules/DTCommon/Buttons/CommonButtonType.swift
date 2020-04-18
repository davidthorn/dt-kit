//
//  CommonButtonType.swift
//  DTKit
//
//  Created by Thorn, David on 12.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import UIKit

/// Determines how a CommonButton will be styled
public enum CommonButtonType: Hashable {

    /// Considered to be the main button that is used in all applications
    case primary

    /// Considered to be the additional buttont that is not the primary button
    case secondary

    /// A button with a standard background and text color
    case common

    /// A disabled common button
    case disabled

    /// A common that is used to display that this buttons action will perform a delete of some kind.
    case destructive

    /// A custom button in the parameters determine the background color and title color.
    case custom(UIColor, UIColor)
    
}
