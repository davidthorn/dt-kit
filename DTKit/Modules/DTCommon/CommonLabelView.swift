//
//  CommonLabelView.swift
//  DTKit
//
//  Created by Thorn, David on 12.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import UIKit

/// A common label view is a common view that wraps a CommonLabel
open class CommonLabelView: CommonView {

    private let label: CommonLabel = .leftAligned

    private var insets: UIEdgeInsets = .init(value: 10)

    public convenience init(textType: TextType,
                            textColor: UIColor? = UIColor.black,
                            insets: UIEdgeInsets = .init(value: 10)) {
        self.init(frame: .zero)
        set(text: textType)
        self.textColor = textColor
        self.insets = insets
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override func commonInit() {
        super.commonInit()
        addSubview(label)
        label.edgesToSuperview(insets: insets)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
    }

    public var textColor: UIColor? {
        get { label.textColor }
        set { label.textColor = newValue }
    }

    public func set(text: TextType) {
        label.set(textType: text)
    }

    public static func create(text: TextType = .text(value: nil),
                              textColor: UIColor = .black,
                              backgroundColor: UIColor = .lightGray,
                              insets: UIEdgeInsets = .init(value: 10)) -> CommonLabelView {

        let labelView = CommonLabelView(textType: text, insets: insets)
        labelView.textColor = textColor
        labelView.backgroundColor = backgroundColor
        return labelView
    }

}
