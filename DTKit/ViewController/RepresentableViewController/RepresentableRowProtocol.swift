//
//  RepresentableRowProtocol.swift
//  DTKit
//
//  Created by Thorn, David on 10.04.20.
//

import UIKit

/// Protocol that provides a model the ability to configure a tableview cell prior to being shown.
public protocol RepresentableRowProtocol {

    associatedtype Item: Hashable & RepresentableItemIdentifierProtocol

    /// The model that is attached to this row.
    var item: Item { get }

    /// The setup method is called so that the cell can be configured by the row, prior to being shown.
    /// - Parameter tableviewCell: The table view cell that will be displayed for this item.
    func setup(tableviewCell: UITableViewCell)
}
