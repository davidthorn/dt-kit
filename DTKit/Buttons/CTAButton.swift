//
//  CTAButton.swift
//  BaseProject
//
//  Created by David Thorn on 12.01.20.
//  Copyright © 2020 David Thorn. All rights reserved.
//

import UIKit

public final class CTAButton: UIButton {
    var edgeInsets: UIEdgeInsets { return .init(horizontal: 15, vertical: 5) }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        backgroundColor = .darkGray
        setTitleColor(.white, for: .normal)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = (bounds.height / 2) * 0.9
    }
    
}
