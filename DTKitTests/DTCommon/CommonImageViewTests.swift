//
//  CommonImageViewTests.swift
//  DTKitTests
//
//  Created by Thorn, David on 18.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import XCTest
@testable import DTKit

class CommonImageViewTests: XCTestCase {

    // MARK: Test Defeault Frame Constructor - No Image

    func test_constructor_frame() {
        let view: CommonImageView = .init(frame: .zero)
        XCTAssertEqual(view.frame, .zero)
        XCTAssertNil(view.image)
        XCTAssertEqual(view.subviews.count, 0)
        XCTAssertEqual(view.contentMode, UIView.ContentMode.scaleToFill)
        XCTAssertNil(view.bundleItem)
    }

     // MARK: Test Bundle Item Constructor - Image

    func test_constructor_bundleItem() {
        let bundleItem: BundleItem = .init(
            imageName: "chat_icon",
            bundle: Bundle(for: CommonImageView.self)
        )
        let view: CommonImageView = .init(bundleItem: bundleItem)
        XCTAssertEqual(view.bundleItem, bundleItem)
        XCTAssertNotNil(view.image)
    }

    // MARK: Test init Constructor - Setting bundleItem Property with Image

    func test_constructor_init() {
        let bundleItem: BundleItem = .init(
            imageName: "chat_icon",
            bundle: Bundle(for: CommonImageView.self)
        )
        let view: CommonImageView = .init()
        XCTAssertNil(view.bundleItem)
        XCTAssertNil(view.image)
        view.bundleItem = bundleItem
        XCTAssertNotNil(view.image)
    }

    // MARK: Test image init Constructor - Image

    func test_constructor_image() {
        let bundleItem: BundleItem = .init(
            imageName: "chat_icon",
            bundle: Bundle(for: CommonImageView.self)
        )
        let view: CommonImageView = .init(image: bundleItem.image)
        XCTAssertNil(view.bundleItem)
        XCTAssertNotNil(bundleItem.image)
        XCTAssertNotNil(view.image)
    }

    // MARK: Test scaleToFill Static Helper Property

    func test_scaleToFill() {
        let view: CommonImageView = .scaleToFill
        XCTAssertNil(view.bundleItem)
        XCTAssertNil(view.image)
        XCTAssertEqual(view.contentMode, UIView.ContentMode.scaleToFill)
    }

    // MARK: Test scaleAspectFit Static Helper Property

    func test_scaleAspectFit() {
        let view: CommonImageView = .scaleAspectFit
        XCTAssertNil(view.bundleItem)
        XCTAssertNil(view.image)
        XCTAssertEqual(view.contentMode, UIView.ContentMode.scaleAspectFit)
    }

    // MARK: Test scaleAspectFill Static Helper Property

    func test_scaleAspectFill() {
        let view: CommonImageView = .scaleAspectFill
        XCTAssertNil(view.bundleItem)
        XCTAssertNil(view.image)
        XCTAssertEqual(view.contentMode, UIView.ContentMode.scaleAspectFill)
    }

    // MARK: Test contentMode Static Helper Method

    func test_contentMode() {

        let bundleItem: BundleItem = .init(
            imageName: "chat_icon",
            bundle: Bundle(for: CommonImageView.self)
        )

        let view: CommonImageView = .contentMode(
            bundleItem: bundleItem,
            contentMode: .scaleToFill,
            tintColor: .blue
        )

        XCTAssertEqual(view.bundleItem, bundleItem)
        XCTAssertNotNil(view.image)
        XCTAssertEqual(view.contentMode, UIView.ContentMode.scaleToFill)

    }

}
