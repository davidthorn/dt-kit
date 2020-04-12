//
//  CommonButtonRepresentation.swift
//  DTKit
//
//  Created by Thorn, David on 12.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import Foundation

open class CommonButtonRepresentation: RepresentalFactory, Hashable {

    private let title: String
    private let type: CommonButtonType
    private let tapHandler: VoidCompletion

    public init(title: String, type: CommonButtonType, tapHandler: @escaping VoidCompletion) {
        self.title = title
        self.type = type
        self.tapHandler = tapHandler
    }

    public convenience init(formFieldType: FormFieldType) {
        switch formFieldType {
        case .button(let title, let type, let tapHandler):
            self.init(title: title, type: type, tapHandler: tapHandler)
        default:
            fatalError("Illegal use of CommonButtonRepresentation")
        }
    }

    public func create() -> ContainedView {
        let containedView = ContainedView()
        let button: CommonButton = .common
        button.commonButtonType = type
        button.onTap(handler: tapHandler)
        button.setTitle(title, for: .normal)
        containedView.addSubview(button)
        button.edgesToSuperview(insets: .init(horizontal: 10, vertical: 10))
        return containedView
    }

    public static func == (lhs: CommonButtonRepresentation, rhs: CommonButtonRepresentation) -> Bool {
        lhs.hashValue == rhs.hashValue
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(type)
    }

}
