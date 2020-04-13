//
//  BorderHeaderView.swift
//  DTKit
//
//  Created by Thorn, David on 12.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import UIKit

open class BorderHeaderView: CommonView {

    private let stackView: CommonStackView = .vertical
    private let header: CommonLabelView = .create()
    private let contentView = CommonView()
    private let contentWrapper = CommonView()

    public convenience init(textType: TextType,
                            contentView: UIView,
                            insets: UIEdgeInsets = .zero) {

        self.init(frame: .zero)
        header.set(text: textType)
        addContentView(contentView, insets: insets)
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override func commonInit() {
        super.commonInit()

        addSubview(stackView)
        stackView.spacing = 0
        stackView.edgesToSuperview(insets: .zero)
        stackView.addArrangedSubview(header)
        stackView.addArrangedSubview(contentWrapper)
        contentWrapper.addSubview(contentView)
        contentView.edgesToSuperview(insets: .init(horizontal: 0, vertical: 10))
    }

    public func addContentView(_ view: UIView, insets: UIEdgeInsets = .zero) {
        if contentSubviews.isNotEmpty {
            contentSubviews.first?.removeFromSuperview()
        }

        contentView.addSubview(view)
        view.edgesToSuperview(insets: insets)
    }

    public var contentSubviews: [UIView] {
        contentView.subviews
    }

    public var headerBackgroundColor: UIColor? {
        get { header.backgroundColor }
        set { header.backgroundColor = newValue }
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
        header.layer.masksToBounds = true
        
        layer.borderColor = UIColor.lightGray.withAlphaComponent(0.4).cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
    }
}
