//
//  CommonLabel.swift
//  DTKit
//
//  Created by Thorn, David on 12.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import UIKit

open class CommonLabel: UILabel {

    public convenience init(textType: TextType) {
        self.init()
        set(textType: textType)
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    open func commonInit() { }

}

public extension UILabel {

    func set(textType: TextType) {
        switch textType {
        case .attributed(let text):
            attributedText = text
        case .text(let value):
            text = value
        }
    }

    static func create(with textType: TextType) -> UILabel {
        CommonLabel(textType: textType)
    }

    static func create(with textType: TextType) -> CommonLabel {
        CommonLabel(textType: textType)
    }

    static func aligned(with textType: TextType, alignment: NSTextAlignment = .left) -> CommonLabel {
        let commonLabel: CommonLabel = .create(with: textType)
        commonLabel.textAlignment = alignment
        return commonLabel
    }

    static var leftAligned: CommonLabel {
        aligned(alignment: .left)
    }

    static var rightAligned: CommonLabel {
        aligned(alignment: .right)
    }

    static var centerAligned: CommonLabel {
        aligned(alignment: .center)
    }

    static func aligned(alignment: NSTextAlignment) -> CommonLabel {
        let label = CommonLabel()
        label.textAlignment = alignment
        return label
    }

    static func leftAligned(with textType: TextType) -> CommonLabel {
        aligned(with: textType, alignment: .left)
    }

    static func rightAligned(with textType: TextType) -> CommonLabel {
        aligned(with: textType, alignment: .right)
    }

    static func centerAligned(with textType: TextType) -> CommonLabel {
        aligned(with: textType, alignment: .center)
    }

}
