//
//  UIView.swift
//  BaseProject
//
//  Created by David Thorn on 12.01.20.
//  Copyright © 2020 David Thorn. All rights reserved.
//

import UIKit

public extension UIView {
    
    func addSubview(_ view: UIView, edges: [UIRectEdge] = []) {
        
        addSubview(view)
        guard edges.isNotEmpty else { return }
        edges.forEach { edge in
            switch edge {
            case .top: break
                
            case .left: break
                
            case .bottom: break
                
            case .right: break
                
            case .all: break
                
            default: break
            }
        }
        
    }

    /// The value of the bounds height property
    var height: CGFloat {
        bounds.size.height
    }

    /// The value of the bounds width property
    var width: CGFloat {
        bounds.size.width
    }

    /// The bounds size property
    var size: CGSize {
        bounds.size
    }

    
}
