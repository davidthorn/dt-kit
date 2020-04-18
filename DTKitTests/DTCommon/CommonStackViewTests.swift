//
//  CommonStackViewTests.swift
//  DTKitTests
//
//  Created by Thorn, David on 18.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import XCTest
@testable import DTKit

class CommonStackViewTests: XCTestCase {

    // MARK: Default Alignment

    func test_defaultAlignment() {
        XCTAssertEqual(CommonStackView.defaultHorizontalAlignment, UIStackView.Alignment.leading)
        XCTAssertEqual(CommonStackView.defaultVerticalAlignment, UIStackView.Alignment.fill)
    }

    // MARK: Default Distribution

    func test_defaultDistribution() {
        XCTAssertEqual(
            CommonStackView.defaultVerticalDistribution,
            UIStackView.Distribution.fillProportionally
        )
        XCTAssertEqual(
            CommonStackView.defaultHorizontalDistribution,
            UIStackView.Distribution.fillProportionally
        )
    }

    // MARK: Default Spacing

    func test_defaultSpacing() {
        XCTAssertEqual(
            CommonStackView.defaultHorizontalSpacing,
            8
        )
        XCTAssertEqual(
            CommonStackView.defaultVerticalSpacing,
            0
        )
    }

    // MARK: Constructor init(frame

    func test_constructor_init_frame() {
        let view: CommonStackView = .init(frame: .zero)
        XCTAssertEqual(view.frame, .zero)
        XCTAssertEqual(view.subviews.count, 0)
        XCTAssertEqual(view.arrangedSubviews.count, 0)
    }

    // MARK: Static Vertical Helper Property

    func test_vertical() {
        let view: CommonStackView = .vertical
        XCTAssertEqual(view.subviews.count, 0)
        XCTAssertEqual(view.arrangedSubviews.count, 0)
        XCTAssertEqual(view.alignment, CommonStackView.defaultVerticalAlignment)
        XCTAssertEqual(view.distribution, CommonStackView.defaultVerticalDistribution)
        XCTAssertEqual(view.axis, NSLayoutConstraint.Axis.vertical)
        XCTAssertEqual(view.spacing, CommonStackView.defaultVerticalSpacing)
    }

    // MARK: Static Horizontal Helper Property

    func test_horizontal() {
        let view: CommonStackView = .horizontal
        XCTAssertEqual(view.subviews.count, 0)
        XCTAssertEqual(view.arrangedSubviews.count, 0)
        XCTAssertEqual(view.alignment, CommonStackView.defaultHorizontalAlignment)
        XCTAssertEqual(view.distribution, CommonStackView.defaultHorizontalDistribution)
        XCTAssertEqual(view.axis, NSLayoutConstraint.Axis.horizontal)
        XCTAssertEqual(view.spacing, CommonStackView.defaultHorizontalSpacing)
    }

}
