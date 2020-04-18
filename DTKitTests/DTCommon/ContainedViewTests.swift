//
//  ContainedViewTests.swift
//  DTKitTests
//
//  Created by Thorn, David on 17.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import XCTest
@testable import DTKit

class ContainedViewTests: XCTestCase {

    // MARK: Default Properties

    func test_defaultLineViewIdentifier() {
        XCTAssertEqual(UIView.defaultLineViewIdentifier, "LineView")
    }

    func test_defaultSpacerViewIdentifier() {
        XCTAssertEqual(UIView.defaultSpacerViewIdentifier, "SpacerView")
    }

    func test_defaultSpacerViewHeight() {
        XCTAssertEqual(UIView.defaultSpacerViewHeight, 15)
    }

    func test_defaultLineViewHeight() {
        XCTAssertEqual(UIView.defaultLineViewHeight, 0.5)
    }

    func test_defaultLineViewBackgroundColor() {
        XCTAssertEqual(UIView.defaultLineViewBackgroundColor, UIColor.black)
    }

    // MARK: ContainedView.Identifier

    func testCreateWithIdentifier()  {
        let view: ContainedView = .create()
        XCTAssertEqual(view.childIdentifier.id, view.identifier)
    }

    func testCreateWithDefaultIdentifier()  {
        let identifier = "empty"
        let view: ContainedView = .create(with: identifier)
        XCTAssertEqual(view.identifier, identifier)
        XCTAssertEqual(view.childIdentifier.id, identifier)
    }

    // MARK: UIView.empty Property

    func test_emptyProperty() {
        let view: ContainedView = .empty
        XCTAssertEqual(view.backgroundColor, UIColor.clear)
        XCTAssertEqual(view.isUserInteractionEnabled, true)
    }

    // MARK: UIView.empty Custome Identifier

    func testUIViewEmpty() {
        let view: ContainedView = UIView.empty
        view.childIdentifier = .init(id: "EmptyView")
        XCTAssertEqual(view.identifier, "EmptyView")
        XCTAssertEqual(view.subviews.count, 0)
    }

    // MARK: UIView.contained Property

    func test_UIViewcontainedProperty() {
        let mainView = UIView()
        let view: ContainedView = mainView.contained
        XCTAssertEqual(view.identifier, String(describing: mainView))
        XCTAssertEqual(view.subviews.count, 1)
        XCTAssertEqual(view.subviews.first, mainView)
    }

    // MARK: UIView.contained Method - Default Parameters

    func test_UIViewcontainedMethod_Default_Parameters() {
        let mainView = UIView()
        let view: ContainedView = mainView.contained()
        XCTAssertNotEqual(view.identifier, String(describing: mainView))
        XCTAssertEqual(view.subviews.count, 1)
        XCTAssertEqual(view.subviews.first, mainView)
    }

    // MARK: UIView.contained Method - Custom Parameters

    func test_UIViewcontainedMethod_Custom_Parameters() {
        let mainView = UIView()
        let view: ContainedView = mainView.contained(
            identifier: "MainView",
            insets: .zero
        )
        XCTAssertEqual(view.identifier, "MainView")
        XCTAssertEqual(view.subviews.count, 1)
        XCTAssertEqual(view.subviews.first, mainView)
    }

    // MARK: SpacerView - Height Identifier - Default Height

    func testSpacerView_DefaultHeight() {
        XCTAssertEqual(UIView.defaultSpacerViewIdentifier, "SpacerView")
        XCTAssertEqual(UIView.defaultSpacerViewHeight, 15)

        let spacerView: ContainedView = UIView.spacerView
        let spacerViewHeightConstraint = spacerView.constraints.first {
            $0.identifier == "\(UIView.defaultSpacerViewIdentifier)-height"
        }
        XCTAssertNotNil(spacerViewHeightConstraint)
        XCTAssertEqual(spacerViewHeightConstraint?.constant, UIView.defaultSpacerViewHeight)
    }

    // MARK: SpacerView - Height Identifier - Custom Height

    func testSpacerView_CustomHeight() {

        let spacerView1: ContainedView = UIView.spacerView(identifier: "spacerView", height: 10)
        let spacerView1HeightConstraint = spacerView1.constraints.first {
            $0.identifier == "\(spacerView1.identifier)-height"
        }
        XCTAssertNotNil(spacerView1HeightConstraint)
        XCTAssertEqual(spacerView1HeightConstraint?.constant, 10)

        let spacerView2: ContainedView = UIView.spacerView(
            identifier: "spacerView",
            height: 10,
            insets: .init(value: 10)
        )
        let spacerView2HeightConstraint = spacerView2.subviews.first?.constraints.first {
            $0.identifier == "\(spacerView1.identifier)-height"
        }
        XCTAssertNotNil(spacerView2HeightConstraint)
        XCTAssertEqual(spacerView2HeightConstraint?.constant, 10)

    }

    // MARK: SpacerView - Height Identifier - Custom Height

    func testSpacerView_CustomInsets() {

        let spacerView2: ContainedView = UIView.spacerView(
            identifier: "spacerView",
            height: 10,
            insets: .init(value: 10)
        )
        let spacerView2HeightConstraint = spacerView2.subviews.first?.constraints.first {
            $0.identifier == "\(spacerView2.identifier)-height"
        }
        XCTAssertNotNil(spacerView2HeightConstraint)
        XCTAssertEqual(spacerView2HeightConstraint?.constant, 10)

    }

    // MARK: LineView - Custom Method

    func testLineView_CustomMethod() {
        let identifier = UUID().uuidString
        let height: CGFloat = 20.9
        let insets: UIEdgeInsets = .init(value: 30)
        let lineColor = UIColor.purple

        let view: ContainedView = UIView.lineView(identifier: identifier,
                                                  height: height,
                                                  insets: insets,
                                                  lineColor: lineColor)

        XCTAssertEqual(view.identifier, identifier)
        XCTAssertEqual(view.subviews.count, 1)


    }

    // MARK: LineView - Default Property

    func testLineView_Default() {
        let view: ContainedView = .lineView
        XCTAssertEqual(view.identifier, UIView.defaultLineViewIdentifier)
        XCTAssertEqual(view.subviews.count, 0)
        XCTAssertEqual(view.backgroundColor, UIView.defaultLineViewBackgroundColor)
        let heightConstraint = view.constraints.first(where:  { $0.identifier == "\(UIView.defaultLineViewIdentifier)-height" })
        XCTAssertNotNil(heightConstraint)
        XCTAssertEqual(heightConstraint?.constant, UIView.defaultLineViewHeight)
    }

    // MARK: CustomButton

    func test_customeButton() {
        let button = CommonButton()
        let contained: ContainedView = button.contained
        XCTAssertEqual(contained.subviews.count, 1)
        XCTAssertEqual(contained.subviews.first, button)
        XCTAssertNotNil(contained.commonButton)
        XCTAssertEqual(contained.commonButton, button)
    }


}
