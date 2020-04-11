//
//  InputFieldRepresentation.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import Foundation

extension InputFieldViewModel: RepresentableItemIdentifierProtocol {

    public typealias ID = String

    public var id: String {
        identifier
    }

}

public typealias InputFieldRepresentationType = InputFieldViewModelProtocol & RepresentableItemIdentifierProtocol

open class InputFieldRepresentation<T: InputFieldRepresentationType & Hashable>: RepresentalFactory, Hashable {

    public let viewModel: T

    public init(viewModel: T) {
        self.viewModel = viewModel
    }

    open func createField() -> InputField<T> {
        InputField<T>()
    }

    public func create() -> ContainedView {
        let containedView = ContainedView()
        let field = createField()
        containedView.addSubview(field)
        field.edgesToSuperview()
        field.setup(viewModel: viewModel)
        return containedView
    }

    public static func == (lhs: InputFieldRepresentation<T>, rhs: InputFieldRepresentation<T>) -> Bool {
        lhs.hashValue == rhs.hashValue
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(viewModel)
    }

}
