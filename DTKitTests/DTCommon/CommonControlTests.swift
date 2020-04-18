//
//  CommonControlTests.swift
//  DTKitTests
//
//  Created by Thorn, David on 18.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import XCTest
@testable import DTKit

class CommonControlTests: XCTestCase {

    // MARK: Constructor init(frame: CGRect)

    func test_Constructor_init_frame() {
        let view: CommonControl = .init(frame: .zero)
        XCTAssertEqual(view.subviews.count, 0)
        XCTAssertEqual(view.frame, .zero)
        XCTAssertNil(view.tapHandler)
    }

    // MARK: Custom Constructors

    func test_Constructor_tapHandler() {
        let handler: CommonTapHandler = { _ in }
        let view: CommonControl = .init(tapHandler: handler)
        XCTAssertEqual(view.subviews.count, 0)
        XCTAssertNotNil(view.tapHandler)
    }

    // MARK: Tap Handler

    func test_tapHandler_saved() {
        var tapHandlerCalled: Int = 0
        let handler: CommonTapHandler = { _ in tapHandlerCalled += 1 }
        let view: CommonControl = .init(tapHandler: handler)
        XCTAssertNotNil(view.tapHandler)
        view.tapHandler?(view)
        XCTAssertEqual(tapHandlerCalled, 1)
    }

    // MARK: Public Interface - onTouchUpInside

    func test_onTouchUpInside() {
        var tapHandlerCalled: Int = 0
        let handler: CommonTapHandler = { _ in tapHandlerCalled += 1 }
        let view: CommonControl = .init(tapHandler: handler)
        view.onTouchUpInside()
        XCTAssertEqual(tapHandlerCalled, 1)
        view.perform(view.touchUpInsideAction, with: nil)
        XCTAssertEqual(tapHandlerCalled, 2)
    }

    // MARK: Public Interface - onTouchDown

    func test_onTouchDown() {
        var tapHandlerCalled: Int = 0
        let handler: CommonTapHandler = { _ in tapHandlerCalled += 1 }
        let view: CommonControl = .init(tapHandler: handler)
        view.onTouchDown()
        XCTAssertEqual(tapHandlerCalled, 0)
        view.perform(view.touchDownAction, with: nil)
        XCTAssertEqual(tapHandlerCalled, 0)
    }


}
