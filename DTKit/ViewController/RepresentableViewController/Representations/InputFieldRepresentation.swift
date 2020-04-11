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
public struct InputFieldRepresentation<T: InputFieldRepresentationType & Hashable>: RepresentalFactory, Hashable {

    public let viewModel: T

    public init(viewModel: T) {
        self.viewModel = viewModel
    }

    public func create() -> ContainedView {
        let containedView = ContainedView()
        let field = InputField<T>()
        containedView.addSubview(field)
        field.edgesToSuperview()
        field.setup(viewModel: viewModel)
        return containedView
    }

}
