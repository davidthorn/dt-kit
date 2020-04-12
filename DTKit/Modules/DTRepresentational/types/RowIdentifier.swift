//
//  RepresentableItemIdentifierProtocol.swift
//  DTKit
//
//  Created by Thorn, David on 10.04.20.
//

import Foundation

public protocol RepresentableItemIdentifierProtocol {
    associatedtype ID: Hashable
    var id: Self.ID { get }
}
