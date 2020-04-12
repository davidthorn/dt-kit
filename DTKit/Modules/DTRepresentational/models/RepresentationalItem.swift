//
//  RepresentationalItem.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import Foundation

public struct RepresentationalItem: RepresentableItemIdentifierProtocol,Hashable {
    public typealias ID = String
    public var id: String
    public init(id: String) {
        self.id = id
    }
}
