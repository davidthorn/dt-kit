//
//  ContainedView.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import UIKit

/// An identifiable View that is used to contain/wrap other views to hide the implementation
public class ContainedView: CommonView {

    public typealias Item = Identifier

    public var item: ContainedView.Identifier {
        childIdentifier
    }

    public var childIdentifier: Item = .init(id: UUID().uuidString)

    public struct Identifier: Hashable {
        public typealias ID = String
        public var id: String
    }

    /// The Identifier of the view.
    public var identifier: String {
        item.id
    }

    /// Creates a ContainedView
    /// - Parameter identifier: The identifier for the contained view.
    public static func create(
        with identifier: String = UUID().uuidString
    ) -> ContainedView {
        let containedView = ContainedView()
        containedView.childIdentifier = ContainedView.Identifier(id: identifier)
        return containedView
    }

    public override func commonInit() {
        super.commonInit()
        backgroundColor = .clear
        isUserInteractionEnabled = true
    }
}

// MARK: ContainedView -> CommonButton Extensions

public extension ContainedView {

    /// Returns a CommonButton is the first subview is a CommonButton
    var commonButton: CommonButton? {
        subviews.first as? CommonButton
    }

}

// MARK: UView -> ContainedView Extensions

public extension UIView {

    /// Returns a ContainedView with zero subviews.
    static let empty: ContainedView = .create()

    /// Returns a ContainedView as a SpacerView
    static let spacer: ContainedView = .spacerView

    /// Returns a ContainedView with this view as the only subview.
    var contained: ContainedView {
        let containedView: ContainedView = .create(with: String(describing: self))
        containedView.addSubview(self)
        edgesToSuperview()
        return containedView
    }

    /// Returns a ContainView with this view as the only subview
    /// - Parameters:
    ///   - identifier: The indentifier given to the contained view.
    ///   - insets: The insets used for pinning the edges to its superview.
    func contained(
        identifier: String = UUID().uuidString,
        insets: UIEdgeInsets = .zero
    ) -> ContainedView {
        let containedView: ContainedView = .create(with: identifier)
        containedView.addSubview(self)
        edgesToSuperview(insets: insets)
        return containedView
    }

}

// MARK: SpacerView

public extension UIView {

    /// The default identiier used for all spacer views.
    static var defaultSpacerViewIdentifier: String { "SpacerView" }

    /// The default height that is used for a spacer view.
    static var defaultSpacerViewHeight: CGFloat { 15 }

    /// Returns a ContainedView
    static var spacerView: ContainedView {
        spacerView(height: defaultSpacerViewHeight)
    }

    /// Returns a ContainedView with zero subviews and with the height of the parameter.
    /// - Parameters:
    ///   - identifier: The identifier provided to the contained view.
    ///   - height: The value set to the view heightAnchor
    ///   - insets: The insets used for the spacer subview.
    static func spacerView(
        identifier: String = defaultSpacerViewIdentifier,
        height: CGFloat = UIView.defaultSpacerViewHeight,
        insets: UIEdgeInsets = .zero
    ) -> ContainedView {
        lineView(
            identifier: identifier,
            height: height,
            insets: insets,
            lineColor: .clear
        )
    }

}

// MARK: LineView Extension

public extension UIView {

    /// The default identifier used for a line view.
    static let defaultLineViewIdentifier: String = "LineView"

    /// The default height for a LineView
    static var defaultLineViewHeight: CGFloat { 0.5 }

    /// The default background color used for a LineView
    static var defaultLineViewBackgroundColor: UIColor { .black }

    /// Returns a ContainedView with the height of `defaultLineViewHeight` and background color of  `defaultLineViewHeight`
    static var lineView: ContainedView {
        lineView()
    }

    /// Returns a ContainedView as a LineView using the parameters to configure it,
    /// - Parameters:
    ///   - identifier: The identifier provided to the contained view.
    ///   - height: The height used for the line view.
    ///   - insets: The insets used as margin for the inner view. If .zero no used view is added.
    ///   - lineColor: The color used for the background color
    static func lineView(
        identifier: String = defaultLineViewIdentifier,
        height: CGFloat = defaultLineViewHeight,
        insets: UIEdgeInsets = .zero,
        lineColor: UIColor = defaultLineViewBackgroundColor
    ) -> ContainedView {
        let containedView: ContainedView = .create(with: identifier)
        if insets == .zero {
            containedView.height(
                constant: height,
                identifier: "\(identifier)-height"
            )
            containedView.backgroundColor = lineColor
        } else {
            let commonView: CommonView = .empty
            commonView.backgroundColor = lineColor
            commonView.height(constant: height, identifier: "\(identifier)-height")
            containedView.addSubview(commonView)
            commonView.edgesToSuperview(insets: insets)
        }

        return containedView
    }

}
