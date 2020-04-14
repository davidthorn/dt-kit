//
//  BundleItem.swift
//  DTKit
//
//  Created by Thorn, David on 14.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import Foundation

public struct BundleItem: Hashable {

    public let imageName: String
    public let bundle: Bundle

    public init(imageName: String, bundle: Bundle = .main) {
        self.imageName = imageName
        self.bundle = bundle
    }

}
