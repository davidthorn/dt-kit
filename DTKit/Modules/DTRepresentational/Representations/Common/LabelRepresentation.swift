//
//  LabelRepresentation.swift
//  DTKit
//
//  Created by Thorn, David on 12.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import UIKit

public final class LabelRepresentation: RepresentalFactory, Hashable {

    private let textType: TextType
    private let textAlignment: NSTextAlignment
    private let identifier: String
    private let label: UILabel

    public convenience init(textType: TextType, textAlignment: NSTextAlignment = .left) {
        self.init(identifier: UUID().uuidString, textType: textType, textAlignment: textAlignment)
    }

    public init(identifier: String, textType: TextType, textAlignment: NSTextAlignment = .left) {
        self.textType = textType
        self.textAlignment = textAlignment
        self.identifier = identifier
        switch textType {
        case .attributed(let text):
            label = UILabel(defaultAttributedString: text ?? "".attributed)
        case .text(let value):
            label = UILabel(defaultAttributedString: value?.attributed ?? "".attributed)
        }
    }

    public func create() -> ContainedView {
        let container: ContainedView = .create(with: identifier)
        container.addSubview(label)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = textAlignment
        label.pinTop(constant: 0)
        label.pinHorizontal(insets: .horizontal(constant: 10))
        label.pinBottom(constant: 0)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        return container
    }

    public static func == (lhs: LabelRepresentation, rhs: LabelRepresentation) -> Bool {
        lhs.hashValue == rhs.hashValue
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(textType)
    }

}

extension String {

    var labelRepresentation: LabelRepresentation {
        labelRepresentation(with: self)
    }

    func labelRepresentation(with identifier: String) -> LabelRepresentation {
        LabelRepresentation(identifier: identifier, textType: .text(value: self))
    }

    func containedView(with identifier: String) -> ContainedView {
        labelRepresentation(with: identifier).create()
    }

    var containedView: ContainedView {
        containedView(with: self)
    }

}

extension NSAttributedString {

    var labelRepresentation: LabelRepresentation {
        labelRepresentation(with: self.string)
    }

    func labelRepresentation(with identifier: String) -> LabelRepresentation {
        LabelRepresentation(identifier: identifier, textType: .attributed(text: self))
    }

    func containedView(with identifier: String) -> ContainedView {
        LabelRepresentation(identifier: identifier, textType: .attributed(text: self)).create()
    }

    var containedView: ContainedView {
        containedView(with: self.string)
    }

}
