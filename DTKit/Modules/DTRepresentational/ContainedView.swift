//
//  ContainedView.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import UIKit

public final class ContainedView: CommonView, RepresentableRowProtocol {

    public typealias Item = Identifier

    public var item: ContainedView.Identifier {
        childIdentifier
    }

    public var childIdentifier: Item = .init(id: UUID().uuidString)

    public func setup(tableviewCell: UITableViewCell) {
        tableviewCell.contentView.addSubview(self)
        edgesToSuperview()
    }

    public struct Identifier: RepresentableItemIdentifierProtocol, Hashable {
        public typealias ID = String
        public var id: String
    }

    public var identifier: String {
        item.id
    }

    public static func create(with identifier: String) -> ContainedView {
        let containedView = ContainedView()
        containedView.childIdentifier = ContainedView.Identifier(id: identifier)
        return containedView
    }
}

public extension ContainedView {

    /// Returns a CommonButton is the first subview is a CommonButton
    var commonButton: CommonButton? {
        subviews.first as? CommonButton
    }

    static let empty: ContainedView = ContainedView()

}


