//
//  UIView.swift
//  BaseProject
//
//  Created by David Thorn on 12.01.20.
//  Copyright © 2020 David Thorn. All rights reserved.
//

import UIKit

public extension Optional where Wrapped: Any {
    var isNil: Bool {
        switch self {
        case .none: return true
        default: return false
        }
    }
    
    var isNotNil: Bool {
        return !isNil
    }
}

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
    
}
