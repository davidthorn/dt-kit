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
            setImage(bundleItem: bundleItem)
        }
    }

    // MARK: Constructors

    public init() {
        super.init(frame: .zero)
        commonInit()
    }

    public init(bundleItem: BundleItem) {
        self.bundleItem = bundleItem
        super.init(frame: .zero)
        commonInit()
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
        super.init(coder: coder)
        commonInit()
    }

    // MARK: Common Init & Setup

    open func commonInit() {
        setImage(bundleItem: bundleItem)
    }

    // MARK: Private Helper Methods

    /// Sets ImageViews image using the bundle item provided
    /// - Parameter bundleItem: The bundle item containing the information about the image.
    private func setImage(bundleItem: BundleItem?) {
        guard bundleItem.isNotNil else { return }

        image = bundleItem?.image?.withRenderingMode(.alwaysTemplate)
    }

}

// MARK: Bundle Item - Image Extensions

public extension BundleItem {

    /// Returns an optional image using the CommonImageViews bundel Item property.
    var image: UIImage? {
        UIImage(named: imageName, in: bundle, compatibleWith: nil)
    }

}

// MARK: Static Helper Properties

public extension UIImageView {

    /// Returns an CommonImageView with the contentMode of scaleToFill
    static var scaleToFill: CommonImageView = .scaleToFill(bundleItem: nil)

    /// Returns an CommonImageView with the contentMode of scaleAspectFit
    static var scaleAspectFit: CommonImageView = .scaleAspectFit(bundleItem: nil)

    /// Returns an CommonImageView with the contentMode of scaleAspectFill
    static var scaleAspectFill: CommonImageView = .scaleAspectFill(bundleItem: nil)

}

// MARK: Static Helper Methods

public extension UIImageView {

    /// Returns an CommonImageView with its image set and contentMode of scaleToFill
    /// - Parameter bundleItem: The optional bundle item use to show the image
    static func scaleToFill(bundleItem: BundleItem? = nil) -> CommonImageView {
        contentMode(bundleItem: bundleItem, contentMode: .scaleToFill)
    }

    /// Returns an CommonImageView with its image set and contentMode of scaleAspectFit
    /// - Parameter bundleItem: The optional bundle item use to show the image
    static func scaleAspectFit(bundleItem: BundleItem? = nil) -> CommonImageView {
        contentMode(bundleItem: bundleItem, contentMode: .scaleAspectFit)
    }

    /// Returns an CommonImageView with its image set and contentMode of scaleAspectFill
    /// - Parameter bundleItem: The optional bundle item use to show the image
    static func scaleAspectFill(bundleItem: BundleItem? = nil) -> CommonImageView {
        contentMode(bundleItem: bundleItem, contentMode: .scaleAspectFill)
    }

    static func contentMode(
        bundleItem: BundleItem? = nil,
        contentMode: UIView.ContentMode,
        tintColor: UIColor? = nil
    ) -> CommonImageView {
        let view: CommonImageView = .init()
        if let tintColor = tintColor {
            view.tintColor = tintColor
        }
        view.bundleItem = bundleItem
        view.contentMode = contentMode

        return view
    }

}

