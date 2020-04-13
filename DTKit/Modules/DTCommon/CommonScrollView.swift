//
//  CommonScrollView.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//

import UIKit

open class CommonScrollView: UIScrollView {

    private let containerView = CommonView()
    private let stackView: CommonStackView = .vertical

    public override init(frame: CGRect) {
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
        containerView.backgroundColor = .white
        containerView.width(view: self)
        containerView.addSubview(stackView)
        stackView.edgesToSuperview()
        stackView.spacing = 20
    }

    public func add(subviews: [UIView]) {
        stackView.addArrangedSubviews(views: subviews)
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        contentSize = CGSize(width: bounds.width, height: stackView.bounds.size.height)
    }

}
