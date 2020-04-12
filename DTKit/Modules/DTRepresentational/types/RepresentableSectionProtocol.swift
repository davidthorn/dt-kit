//
//  RepresentableSectionProtocol.swift
//  DTKit
//
//  Created by Thorn, David on 10.04.20.
//

import Foundation
import DTConstraints

/// Protocol that is used to
public protocol RepresentableSectionProtocol {
    associatedtype Row: RepresentableRowProtocol & Hashable
    var rows: [Row] { get }
}

public extension RepresentableSectionProtocol {

    /// Returns the numbers of rows within this section.
    var numberOfRowsInSection: Int {
        rows.count
    }

}


