//
//  RepresentableViewModelProtocol.swift
//  DTKit
//
//  Created by Thorn, David on 10.04.20.
//

import Foundation

public protocol RepresentableViewModelProtocol {
    associatedtype Section: RepresentableSectionProtocol & Hashable
    var sections: [Section] { get }
}
