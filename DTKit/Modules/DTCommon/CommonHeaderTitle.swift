//
//  CommonHeaderTitle.swift
//  DTKit
//
//  Created by Thorn, David on 10.04.20.
//

import UIKit

open class CommonHeaderTitle: CommonView {

    private let stackView = UIStackView()
    private let container = CommonView()
    private let label: UILabel = .leftAligned()
    private var insets: UIEdgeInsets = .init(top: 20,
                                             left: 0,
                                             bottom: 0,
                                             right: 0)

    public var textType: TextType = .text(value: nil) {
        didSet {
            setup(viewModel: textType)
        }
    }

    public convenience init(textType: TextType, insets: UIEdgeInsets = .zero) {
        self.init()
        self.textType = textType
        self.insets = insets
    }

    public convenience init(attributedString: NSAttributedString, insets: UIEdgeInsets = .zero) {
        self.init(textType: .attributed(text: attributedString), insets: insets)
    }

    public convenience init(text: String, insets: UIEdgeInsets = .zero) {
        self.init(textType: .text(value: text), insets: insets)
        label.textColor = .darkGray
    }

    override public func commonInit() {
        super.commonInit()
        backgroundColor = .white

        addSubview(container)
        container.backgroundColor = .lightGray
        container.edgesToSuperview(insets: insets)

        container.addSubview(stackView)
        stackView.edgesToSuperview(insets: .init(horizontal: 20, vertical: 10))
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.addArrangedSubview(label)
    }

    public func setup(viewModel: TextType) {
        switch viewModel {
        case .attributed(let text):
            label.text = nil
            label.attributedText = text
        case .text(let value):
            label.attributedText = nil
            label.text = value
        }
    }


}
