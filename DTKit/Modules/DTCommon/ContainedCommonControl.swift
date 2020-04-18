//
//  ContainedCommonControl.swift
//  DTKit
//
//  Created by Thorn, David on 17.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import UIKit

/// A CommonControl that can be used as a container for other views.
open class ContainedCommonControl: CommonControl {

    public typealias Item = Identifier

    public var item: ContainedCommonControl.Identifier {
        childIdentifier
    }

    public var childIdentifier: Item = .init(id: UUID().uuidString)

    public struct Identifier: Hashable {
        public typealias ID = String
        public var id: String
    }

    /// The Identifier of the contained common view.
    public var identifier: String {
        item.id
    }

    /// Creates a ContainedView
    /// - Parameter identifier: The identifier for the contained view.
    public static func create(
        with identifier: String = UUID().uuidString
    ) -> ContainedView {
        let containedView: ContainedView = .empty
        containedView.childIdentifier = ContainedView.Identifier(id: identifier)
        return containedView
    }

    public override func commonInit() {
        super.commonInit()
        backgroundColor = .clear
        isUserInteractionEnabled = true
    }

}

// MARK: String -> ContainedCommonControl

public extension String {

    /// Converts a String to a ContainedCommonControl
    /// - Parameters:
    ///   - attributes: The attributes to apply to the string when converting to a attributes string.
    ///   - insets: Insets used for the strings common view.
    ///   - handler: The callback called on touchUpInside.
    func onTap(
        attributes: [NSAttributedString.Key: Any] = [:],
        insets: UIEdgeInsets = .zero,
        handler: @escaping CommonTapHandler
    ) -> ContainedCommonControl {
        let commonControl = ContainedCommonControl(tapHandler: handler)
        let view = with(attributes: attributes).containedView
        view.isUserInteractionEnabled = false
        commonControl.addSubview(view)
        view.edgesToSuperview(insets: insets)
        return commonControl
    }

}

// MARK: NSAttributedString -> ContainedCommonControl

public extension NSAttributedString {

    /// Converts a String to a ContainedCommonControl
    /// - Parameters:
    ///   - insets: Insets used for the attributes strings common view.
    ///   - handler: The callback called on touchUpInside.
    func onTap(
        insets: UIEdgeInsets = .zero,
        handler: @escaping CommonTapHandler
    ) -> ContainedCommonControl {
        let commonControl = ContainedCommonControl(tapHandler: handler)
        let view = containedView
        view.isUserInteractionEnabled = false
        commonControl.addSubview(view)
        view.edgesToSuperview(insets: insets)
        return commonControl

    }

}
