//
//  RepresentalFactory.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import Foundation

public protocol RepresentalFactory {
    func create() -> ContainedView
}
