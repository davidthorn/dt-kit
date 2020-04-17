//
//  CommonScrollableStackView.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//

import UIKit

open class CommonScrollableStackView: UIScrollView {

    public struct Constants: Hashable {
        public let stackviewInsets: UIEdgeInsets
        public let stackViewSpacing: CGFloat
        public let backgroundColor: UIColor
        public init(
            stackviewInsets: UIEdgeInsets = .zero,
            stackViewSpacing: CGFloat = 4,
            backgroundColor: UIColor = .white
        ) {
            self.stackviewInsets = stackviewInsets
            self.stackViewSpacing = stackViewSpacing
            self.backgroundColor = backgroundColor
        }

        public static let standard: Constants = .init()
    }

    private let containerView = CommonView()
    private let stackView: CommonStackView = .vertical
    private let constants: CommonScrollableStackView.Constants

    public convenience init(constants: CommonScrollableStackView.Constants = .standard) {
        self.init(frame: .zero, constants: constants)
    }

    public init(frame: CGRect, constants: CommonScrollableStackView.Constants = .standard) {
        self.constants = constants
        super.init(frame: frame)
        commonInit()
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func commonInit() {
        backgroundColor = .white

        addSubview(containerView)

        containerView.edgesToSuperview()
        containerView.width(view: self)
        containerView.addSubview(stackView)
        stackView.edgesToSuperview()
        stackView.edgesToSuperview(insets: constants.stackviewInsets)
        setup(constants: constants)
    }

    public func setup(constants: CommonScrollableStackView.Constants) {
        stackView.spacing = constants.stackViewSpacing
        stackView.backgroundColor = backgroundColor
    }

    public func add(subviews: [UIView]) {
        stackView.addArrangedSubviews(views: subviews)
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        contentSize = CGSize(
            width: width,
            height: stackView.height
        )
    }

}
