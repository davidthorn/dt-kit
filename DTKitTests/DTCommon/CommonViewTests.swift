//
//  CommonViewTests.swift
//  DTKitTests
//
//  Created by Thorn, David on 18.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import XCTest
@testable import DTKit

class CommonViewTests: XCTestCase {

    // MARK: Constructor init(frame: CGRect)

    func testDefaultConstructor_frame() {
        let view: CommonView = CommonView(frame: .zero)
        XCTAssertEqual(view.frame, .zero)
        XCTAssertEqual(view.subviews.count, 0)
    }

    // MARK: UIView.common property

    func test_UIViewcommon() {
        let view: CommonView = .common
        XCTAssertEqual(view.frame, .zero)
        XCTAssertEqual(view.subviews.count, 0)
    }


}
