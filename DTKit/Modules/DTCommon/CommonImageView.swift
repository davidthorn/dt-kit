//
//  CommonImageView.swift
//  DTKit
//
//  Created by Thorn, David on 13.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import UIKit

open class CommonImageView: UIImageView {

    public var bundleItem: BundleItem? {
        didSet {
            image = bundleItem?.image?.withRenderingMode(.alwaysTemplate)
        }
    }

    public convenience init() {
        self.init(image: nil)
    }

    public convenience init(bundleItem: BundleItem) {
        self.init(image: bundleItem.image)
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public override init(image: UIImage?) {
        super.init(image: image)
        commonInit()
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func commonInit() { }

}

public extension BundleItem {

    var image: UIImage? {
        UIImage(named: imageName, in: bundle, compatibleWith: nil)
    }

}
