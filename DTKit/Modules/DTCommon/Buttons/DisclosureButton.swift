//
//  DisclosureButton.swift
//  DTKit
//
//  Created by Thorn, David on 13.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import UIKit

open class DisclosureButton: CommonControl {

    public struct Constants: Hashable {

        public let height: CGFloat
        public let leftIconLeading: CGFloat
        public let leftIconHeight: CGFloat
        public let leftIconTintColor: UIColor
        public let leftIconBundleItem: BundleItem
        public let stackViewInsets: UIEdgeInsets
        public let disclosureIconSize: CGSize
        public let badgeIconSize: CGSize

        public init(height: CGFloat = 55,
                    leftIconHeight: CGFloat = 28,
                    leftIconLeading: CGFloat = 15,
                    leftIconTintColor: UIColor = UIColor.darkGray.withAlphaComponent(0.8),
                    leftIconBundleItem: BundleItem = .init(imageName: "chat_icon"),
                    stackViewInsets: UIEdgeInsets = .init(top: 0, left: 15, bottom: 0, right: 0),
                    disclosureIconSize: CGSize = .init(width: 40, height: 40),
                    badgeIconSize: CGSize = .init(width: 25, height: 25)) {

            self.height = height
            self.leftIconHeight = leftIconHeight
            self.leftIconLeading = leftIconLeading
            self.leftIconTintColor = leftIconTintColor
            self.leftIconBundleItem = leftIconBundleItem

            self.stackViewInsets = stackViewInsets

            self.disclosureIconSize = disclosureIconSize
            self.badgeIconSize = badgeIconSize

        }
    }

    public var constants = DisclosureButton.Constants()

    private lazy var badgeIconAttributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor.black,
        .font: UIFont.systemFont(ofSize: 14, weight: .bold)
    ]
    private lazy var badgeIconText: TextType =  "1".with(attributes: badgeIconAttributes).textType

    private let stackView: CommonStackView = .horizontal
    private let leftIcon = CommonImageView()
    private let commonLabel: CommonLabel = .leftAligned
    private lazy var badgeIcon: CommonLabel = .centerAligned(with: badgeIconText)
    private let disclosureIcon = CommonImageView()
    private let line = CommonView()

    open override func commonInit() {
        super.commonInit()

        addSubview(leftIcon)
        addSubview(stackView)
        addSubview(line)

        line.height(constant: 0.5)
        line.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
        line.pinBottom(constant: 0, priority: .required)
        line.pinLead(view: leftIcon, constant: constants.stackViewInsets.left)
        line.width(view: stackView)

        stackView.addArrangedSubviews(views: [
            commonLabel,
            badgeIcon,
            disclosureIcon
        ])

        height(constant: constants.height)

        leftIcon.pinLeading(constant: constants.leftIconLeading)
        leftIcon.height(constant: constants.leftIconHeight)
        leftIcon.width(equalTo: leftIcon.heightAnchor, multiplier: 1)
        leftIcon.tintColor = constants.leftIconTintColor
        leftIcon.bundleItem = constants.leftIconBundleItem
        leftIcon.centerY(insets: .zero)
        leftIcon.contentMode = .scaleAspectFill

        stackView.pinLead(view: leftIcon, constant: constants.stackViewInsets.left)
        stackView.pinTrailing(constant: constants.stackViewInsets.right)
        stackView.centerY(insets: constants.stackViewInsets)

        badgeIcon.backgroundColor = .systemRed
        badgeIcon.width(constant: constants.badgeIconSize.width)
        badgeIcon.height(constant: constants.badgeIconSize.height)
        badgeIcon.centerY(insets: .zero)

        commonLabel.set(textType: .text(value: "Messages"))

        disclosureIcon.tintColor = UIColor.darkGray.withAlphaComponent(0.8)
        disclosureIcon.bundleItem = .init(imageName: "disclosure_right")
        disclosureIcon.centerY(insets: .zero)
        disclosureIcon.contentMode = .scaleAspectFill
        disclosureIcon.height(constant: constants.disclosureIconSize.height)
        disclosureIcon.width(constant: constants.disclosureIconSize.width)

        leftIcon.isUserInteractionEnabled = false
        stackView.isUserInteractionEnabled = false
        disclosureIcon.isUserInteractionEnabled = false
        badgeIcon.isUserInteractionEnabled = false
        isUserInteractionEnabled = true
        addTarget(self, action: #selector(touchDown), for: .touchDown)
        addTarget(self, action: #selector(touchUp), for: .touchUpInside)

    }

    open override func layoutSubviews() {
        super.layoutSubviews()

        badgeIcon.layoutIfNeeded()
        badgeIcon.layer.masksToBounds = true
        badgeIcon.layer.cornerRadius = badgeIcon.bounds.width / 2
    }

    @objc func touchDown() {
        onTouchDown()
    }

    @objc func touchUp() {
        onTouchUpInside()
    }

    open override func onTouchDown() {
        backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        alpha = 0.4
    }

    open override func onTouchUpInside() {

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            self.backgroundColor = .white
            self.alpha = 1
        }

        super.onTouchUpInside()
    }

}
