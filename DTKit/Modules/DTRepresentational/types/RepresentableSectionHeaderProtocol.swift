//
//  RepresentableSectionHeaderProtocol.swift
//  DTKit
//
//  Created by Thorn, David on 10.04.20.
//

import UIKit

/// A protocol used to define how to section header should be within a section.
public protocol RepresentableSectionHeaderProtocol {

    /// The title that is used for the section header is the view property is nil
    var title: String? { get }

    /// The view that is used for the section header.
    /// The title will not be used if this property does not return nil.
    var view: UIView? { get }
    
}
