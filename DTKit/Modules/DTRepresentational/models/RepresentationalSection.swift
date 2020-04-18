//
//  RepresentationalSection.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import UIKit

/// A struct that is used to represent a section within a tableview.
public struct RepresentationalSection: RepresentableSectionProtocol, Hashable {
    public var rows: [Row]
    public typealias Row = ContainedView
    public init(rows: [Row]) {
        self.rows = rows
    }
}

// MARK: ContainedView - Representation

extension ContainedView.Identifier: RepresentableItemIdentifierProtocol { }

extension ContainedView: RepresentableRowProtocol {

    /// The contained view is added to the content view of the tablview cell.
    /// - Parameter tableviewCell: The tableview cell that the contained view will be a subview of
    public func setup(tableviewCell: UITableViewCell) {
        tableviewCell.contentView.addSubview(self)
        edgesToSuperview()
    }

}

// MARK: ContainedCommonControl - Representation

extension ContainedCommonControl.Identifier: RepresentableItemIdentifierProtocol { }

extension ContainedCommonControl: RepresentableRowProtocol {

    /// The contained view is added to the content view of the tablview cell.
    /// - Parameter tableviewCell: The tableview cell that the contained view will be a subview of
    public func setup(tableviewCell: UITableViewCell) {
        tableviewCell.contentView.addSubview(self)
        edgesToSuperview()
    }

}
