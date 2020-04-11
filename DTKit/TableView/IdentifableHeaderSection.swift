//
//  IdentifableHeaderSection.swift
//  DTKit
//
//  Created by Thorn, David on 10.04.20.
//

import UIKit

public typealias RepresentableHeaderSection = RepresentableSectionProtocol & RepresentableSectionHeaderProtocol
public typealias IdentifiableHeaderSectionType = RepresentableHeaderSection & Hashable
public typealias IdentifiableRow = RepresentableRowProtocol & Hashable

protocol IdentifableHeaderSectionViewModelProtocol {
    associatedtype Item: IdentifiableRow
}

open class IdentifableHeaderSection<T: IdentifiableRow>: IdentifiableHeaderSectionType {

    public var view: UIView? {
        headerView()
    }

    public typealias Row = T
    public var rows: [Row] = []
    public var title: String?

    public init(title: String?, rows: [Row]) {
        self.title = title
        self.rows = rows
    }

    open func headerView() -> UIView? {
        guard let title = title else { return nil }

        return CommonHeaderTitle(textType: .text(value: title))
    }

    public static func == (lhs: IdentifableHeaderSection<T>, rhs: IdentifableHeaderSection<T>) -> Bool {
        lhs.hashValue == rhs.hashValue
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(rows)
        hasher.combine(title)
    }

}
