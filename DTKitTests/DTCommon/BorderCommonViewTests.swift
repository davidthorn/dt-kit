//
//  BorderCommonViewTests.swift
//  DTKitTests
//
//  Created by Thorn, David on 18.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import XCTest
@testable import DTKit

class BorderCommonViewTests: XCTestCase {

    // MARK: Test - Default Properties

    func test_default_properties() {
        XCTAssertEqual(BorderCommonView.defaultCornerRadius, 5)
        XCTAssertEqual(BorderCommonView.defaultBorderColor, UIColor.darkGray.withAlphaComponent(0.4))
        XCTAssertEqual(BorderCommonView.defaultBorderWidth, 1)
    }

    // MARK: Test - BorderCommonView - Default Properties

    func test_borderView_default_properties() {
        let view: BorderCommonView = .init()
        view.layoutSubviews()
        XCTAssertEqual(view.layer.cornerRadius, BorderCommonView.defaultCornerRadius)
        XCTAssertEqual(view.layer.borderColor, BorderCommonView.defaultBorderColor.cgColor)
        XCTAssertEqual(view.layer.borderWidth, BorderCommonView.defaultBorderWidth)
    }

    // MARK: Test - Border Color - Setters and Getters

    func test_borderColor() {
        let view: BorderCommonView = .init()
        XCTAssertEqual(view.borderColor, BorderCommonView.defaultBorderColor)
        view.borderColor = .red
        XCTAssertEqual(view.layer.borderColor, UIColor.red.cgColor)
    }

    // MARK: Test - Border Width - Setters and Getters

    func test_borderWidth() {
        let view: BorderCommonView = .init()
        XCTAssertEqual(view.borderWidth, BorderCommonView.defaultBorderWidth)
        view.borderWidth = 5
        XCTAssertEqual(view.layer.borderWidth, 5)
    }

    // MARK: Test - Corner Radius - Setters and Getters

    func test_cornerRadius() {
        let view: BorderCommonView = .init()
        XCTAssertEqual(view.cornerRadius, BorderCommonView.defaultCornerRadius)
        view.cornerRadius = 5
        XCTAssertEqual(view.layer.cornerRadius, 5)
    }

    // MARK: Test - BorderedView - Method - Custom

    func test_borderedView_custom() {
        let view: BorderCommonView = .borderedView(
            borderColor: .red,
            borderWidth: 1,
            cornerRadius: 1
        )
        XCTAssertEqual(view.cornerRadius, 1)
        XCTAssertEqual(view.borderWidth, 1)
        XCTAssertEqual(view.borderColor, UIColor.red)
        view.layoutSubviews()
        XCTAssertEqual(view.layer.cornerRadius, 1)
        XCTAssertEqual(view.layer.borderWidth, 1)
        XCTAssertEqual(view.layer.borderColor, UIColor.red.cgColor)
    }

    // MARK: Test - BorderedView - Method - Default

    func test_borderedView_method() {
        let view: BorderCommonView = .borderedView()
        XCTAssertEqual(view.cornerRadius, BorderCommonView.defaultCornerRadius)
        XCTAssertEqual(view.borderWidth, BorderCommonView.defaultBorderWidth)
        XCTAssertEqual(view.borderColor, BorderCommonView.defaultBorderColor)
        view.layoutSubviews()
        XCTAssertEqual(view.layer.cornerRadius, BorderCommonView.defaultCornerRadius)
        XCTAssertEqual(view.layer.borderWidth, BorderCommonView.defaultBorderWidth)
        XCTAssertEqual(view.layer.borderColor, BorderCommonView.defaultBorderColor.cgColor)
    }

}
