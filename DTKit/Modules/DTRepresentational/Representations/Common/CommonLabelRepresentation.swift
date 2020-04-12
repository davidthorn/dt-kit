//
//  CommonLabelRepresentation.swift
//  DTKit
//
//  Created by Thorn, David on 12.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import UIKit

/// A representation that wraps of UILabel in a ContainedView
public final class CommonLabelRepresentation: RepresentalFactory, Hashable {

    /// The identifier used to identify the representation and contained view.
    public let identifier: String

    /// The text used for the label.
    private let textType: TextType

    /// The alignment used for the labels text.
    private let textAlignment: NSTextAlignment

    /// The label used for the representation
    private let label: CommonLabel

    /// The insets used to position the label within the contained view.
    private let insets: UIEdgeInsets

    public init(identifier: String? = nil,
                textType: TextType,
                textAlignment: NSTextAlignment = .left,
                insets: UIEdgeInsets = .horizontal(constant: 10),
                isMultiline: Bool = true) {

        self.insets = insets
        self.textType = textType
        self.textAlignment = textAlignment
        self.identifier = identifier ?? textType.identifier
        label = .aligned(with: textType, alignment: textAlignment)
        if isMultiline {
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
        }
    }

    public func create() -> ContainedView {
        let container: ContainedView = .create(with: identifier)
        container.addSubview(label)
        label.edgesToSuperview(insets: insets)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        return container
    }

    public static func == (lhs: CommonLabelRepresentation, rhs: CommonLabelRepresentation) -> Bool {
        lhs.hashValue == rhs.hashValue
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(textType)
    }

}

public extension String {

    var labelRepresentation: CommonLabelRepresentation {
        labelRepresentation(with: self)
    }

    func labelRepresentation(with identifier: String? = nil,
                             insets: UIEdgeInsets = .horizontal(constant: 10)) -> CommonLabelRepresentation {

        CommonLabelRepresentation(identifier: identifier ?? self,
                            textType: .text(value: self),
                            insets: insets)
    }

    func containedView(with identifier: String? = nil,
                       insets: UIEdgeInsets = .horizontal(constant: 10)) -> ContainedView {
        labelRepresentation(with: identifier ?? self, insets: insets).create()
    }

    var containedView: ContainedView {
        containedView(with: self)
    }

}

public extension NSAttributedString {

    var labelRepresentation: CommonLabelRepresentation {
        labelRepresentation(with: self.string)
    }

    func labelRepresentation(with identifier: String) -> CommonLabelRepresentation {
        CommonLabelRepresentation(identifier: identifier, textType: .attributed(text: self))
    }

    func containedView(with identifier: String? = nil,
                       insets: UIEdgeInsets = .horizontal(constant: 10)) -> ContainedView {
        CommonLabelRepresentation(identifier: identifier ?? self.string,
                            textType: .attributed(text: self),
                            insets: insets).create()
    }

    var containedView: ContainedView {
        containedView(with: self.string)
    }

}
