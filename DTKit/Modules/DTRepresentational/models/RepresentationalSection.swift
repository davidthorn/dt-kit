//
//  RepresentationalSection.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import Foundation

public struct RepresentationalSection: RepresentableSectionProtocol, Hashable {
    public var rows: [Row]
    public typealias Row = ContainedView
    public init(rows: [Row]) {
        self.rows = rows
    }
}
