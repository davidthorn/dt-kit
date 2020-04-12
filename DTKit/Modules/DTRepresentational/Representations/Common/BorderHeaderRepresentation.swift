//
//  BorderHeaderRepresentation.swift
//  DTKit
//
//  Created by Thorn, David on 12.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import UIKit

public final class BorderHeaderRepresentation: RepresentalFactory, Hashable {

    /// The string that can be used to identify the representation and contained view.
    private let identifier: String

    /// The text that will be displayed in the header portion of the view
    private let textType: TextType

    /// The background color of the header view.
    private let headerBackgroundColor: UIColor

    /// The UIView that will contain the added content
    private let contentView: UIView

    /// The insets used to position the header view
    private let insets: UIEdgeInsets

    /// Default constructor
    ///
    /// - Parameters:
    ///   - identifier: The identifier used, if nil the textTypes string property will be used.
    ///   - textType: The text that will be displayed in the header portion of the view
    ///   - headerBackgroundColor: The background color of the header view.
    ///   - contentView: The UIView that will contain the added content
    ///   - insets: The insets used to position the header view
    public init(identifier: String? = nil,
                textType: TextType,
                headerBackgroundColor: UIColor = .lightGray,
                contentView: UIView,
                insets: UIEdgeInsets = .zero) {

        self.identifier = identifier ?? textType.string ?? UUID().uuidString
        self.textType = textType
        self.contentView = contentView
        self.headerBackgroundColor = headerBackgroundColor
        self.insets = insets
    }

    /// Converts the representation to a contained view.
    public func create() -> ContainedView {
        let containedView: ContainedView = .create(with: identifier)
        let borderView = BorderHeaderView(textType: textType,
                                          contentView: contentView,
                                          insets: insets)
        borderView.headerBackgroundColor = headerBackgroundColor

        containedView.addSubview(borderView)
        borderView.edgesToSuperview()
        return containedView
    }

    public static func == (lhs: BorderHeaderRepresentation, rhs: BorderHeaderRepresentation) -> Bool {
        lhs.hashValue == rhs.hashValue
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
        hasher.combine(insets)
        hasher.combine(textType)
        hasher.combine(contentView)
        hasher.combine(headerBackgroundColor)
    }

}
