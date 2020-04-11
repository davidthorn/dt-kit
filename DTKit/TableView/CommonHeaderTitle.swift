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

    public convenience init(textType: TextType) {
        self.init()
        setup(viewModel: textType)
    }

    public convenience init(attributedString: NSAttributedString) {
        self.init(textType: .attributed(text: attributedString))
    }

    public convenience init(text: String) {
        self.init(textType: .text(value: text))
        label.textColor = .darkGray
    }

    override public func commonInit() {
        super.commonInit()
        backgroundColor = .white

        addSubview(container)
        container.backgroundColor = .lightGray
        container.pinHorizontal()
        container.pinTop(constant: 20)
        container.pinBottom(constant: 0)

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
