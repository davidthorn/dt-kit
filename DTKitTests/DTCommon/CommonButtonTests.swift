//
//  CommonButtonTests.swift
//  DTKitTests
//
//  Created by Thorn, David on 18.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import XCTest
@testable import DTKit

class CommonButtonTests: XCTestCase {

    // MARK: Common Button - Disabled Type

    func test_convenience_init_disabled() {

        let view: CommonButton = CommonButton(buttonType: .disabled)
        view.positiveState = .primary
        validateDisabledState(view: view)

        view.applyPositiveState()
        test_convenience_init_primary()

        let handler: ButtonTapHandler = { _ in }
        let disabledButton: CommonButton = .disabled(tapHandler: handler)
        disabledButton.positiveState = .primary
        validateDisabledState(view: disabledButton)
        disabledButton.applyPositiveState()
        test_convenience_init_primary()
    }

    // MARK: Common Button - Destructive Type

    func test_convenience_init_destructive() {
        let view: CommonButton = CommonButton(buttonType: .destructive)
        view.positiveState = .secondary
        validateDestructiveState(view: view)

        view.applyPositiveState()
        validateSecondaryState(view: view, hasLayout: true)

        let handler: ButtonTapHandler = { _ in }
        let destructiveButton: CommonButton = .destructive(tapHandler: handler)
        destructiveButton.positiveState = .secondary
        validateDestructiveState(view: destructiveButton)
        destructiveButton.applyPositiveState()
        XCTAssertEqual(destructiveButton.commonButtonType, .secondary)
        validateSecondaryState(view: destructiveButton, hasLayout: true)
    }

    // MARK: Common Button - Common Type

    func test_convenience_init_common() {
        let view: CommonButton = CommonButton(buttonType: .common)
        view.positiveState = .secondary
        validateCommonState(view: view)

        let handler: ButtonTapHandler = { _ in }
        let commonButton: CommonButton = .common(tapHandler: handler)
        commonButton.positiveState = .secondary
        validateCommonState(view: commonButton)
        commonButton.applyPositiveState()
        XCTAssertEqual(commonButton.commonButtonType, .secondary)
        validateSecondaryState(view: commonButton, hasLayout: true)
    }

    // MARK: Common Button - Primary Type

    func test_convenience_init_primary() {
        let view: CommonButton = CommonButton(buttonType: .primary)
        view.positiveState = .primary
        validatePrimaryState(view: view)

        let handler: ButtonTapHandler = { _ in }
        let primaryButton: CommonButton = .primary(tapHandler: handler)
        primaryButton.positiveState = .primary
        validatePrimaryState(view: primaryButton)
        primaryButton.applyPositiveState()
        XCTAssertEqual(primaryButton.commonButtonType, .primary)
        validatePrimaryState(view: primaryButton, hasLayout: true)
    }

    // MARK: Common Button - Secondary Type

    func test_convenience_init_secondary() {
        let view: CommonButton = CommonButton(buttonType: .secondary)
        view.positiveState = .primary
        validateSecondaryState(view: view)

        let handler: ButtonTapHandler = { _ in }
        let secondaryButton: CommonButton = .secondary(tapHandler: handler)
        secondaryButton.positiveState = .primary
        validateSecondaryState(view: secondaryButton)
        secondaryButton.applyPositiveState()
        XCTAssertEqual(secondaryButton.commonButtonType, .primary)
        validatePrimaryState(view: secondaryButton, hasLayout: true)
    }

    // MARK: Common Button - Custom Type

    func test_convenience_init_custom() {
        let backgroundColor = UIColor.blue
        let titleColor = UIColor.white

        let view: CommonButton = CommonButton(buttonType: .custom(backgroundColor, titleColor))
        XCTAssertEqual(view.commonButtonType, .custom(backgroundColor, titleColor))
        XCTAssertNotNil(view.defaultBackgroundColor)
        XCTAssertEqual(view.backgroundColor, backgroundColor)
        XCTAssertEqual(view.titleColor(for: .normal), titleColor)
        XCTAssertEqual(view.layer.cornerRadius, 0)
        XCTAssertEqual(view.layer.borderWidth, 0)
        view.layoutSubviews()
        XCTAssertEqual(view.layer.borderColor, UIColor.clear.cgColor)
        XCTAssertEqual(view.layer.cornerRadius, CommonButton.defaultCornerRadius)
        XCTAssertEqual(view.layer.borderWidth, 0)
    }

    // MARK: Common Button - Touch Down Control Event

    func test_handleTouchDownEvent() {
        let button: CommonButton = .common
        button.layoutSubviews()
        button.perform(button.handleTouchDownAction, with: nil)
        XCTAssertEqual(button.backgroundColor, button.defaultBackgroundColor?.withAlphaComponent(0.6))
        XCTAssertEqual(button.titleColor(for: .normal), CommonButton.defaultTouchDownTitleColor)
    }

    // MARK: Common Button - Touch Up Inide Control Event

    func test_handleTouchUpEvent() {
        var handlerTapped: Int = 0
        let handler: ButtonTapHandler = { _ in handlerTapped += 1 }
        let button: CommonButton = .common(tapHandler: handler)
        button.layoutSubviews()
        button.perform(button.handleTouchUpAction, with: nil)
        XCTAssertEqual(button.isHighlighted, false)
        XCTAssertEqual(button.backgroundColor, button.defaultBackgroundColor)
        XCTAssertEqual(button.titleColor(for: .normal), button.defaultTitleColor)
        XCTAssertEqual(handlerTapped, 1)
    }

}

// MARK: Common Button - Validation Common Type State

extension CommonButtonTests {

    func validateCommonState(view: CommonButton) {
        XCTAssertEqual(view.commonButtonType, .common)
        XCTAssertNotNil(view.defaultBackgroundColor)
        XCTAssertEqual(view.backgroundColor, CommonButton.defaultCommonBackgroundColor)
        XCTAssertEqual(view.titleColor(for: .normal), CommonButton.defaultCommonTitleColor)
        XCTAssertEqual(view.layer.cornerRadius, 0)
        XCTAssertEqual(view.layer.borderWidth, 0)
        view.layoutSubviews()
        XCTAssertEqual(view.layer.borderColor, CommonButton.defaultBorderColor.cgColor)
        XCTAssertEqual(view.layer.cornerRadius, CommonButton.defaultCornerRadius)
        XCTAssertEqual(view.layer.borderWidth, CommonButton.defaultBorderWidth)
    }

}

// MARK: Common Button - Validation Disabled Type State

extension CommonButtonTests {

    func validateDisabledState(view: CommonButton) {
        XCTAssertEqual(view.commonButtonType, .disabled)
        XCTAssertNotNil(view.defaultBackgroundColor)
        XCTAssertEqual(view.backgroundColor, CommonButton.defaultDisabledBackgroundColor)
        XCTAssertEqual(view.titleColor(for: .disabled), CommonButton.defaultDisabledTitleColor)
        XCTAssertEqual(view.layer.cornerRadius, 0)
        XCTAssertEqual(view.layer.borderWidth, 0)
        view.layoutSubviews()
        XCTAssertEqual(view.layer.borderColor, UIColor.clear.cgColor)
        XCTAssertEqual(view.layer.cornerRadius, CommonButton.defaultCornerRadius)
        XCTAssertEqual(view.layer.borderWidth, 0)
    }

}

// MARK: Common Button - Validation Primary Type State

extension CommonButtonTests {

    func validatePrimaryState(view: CommonButton, hasLayout: Bool = false) {
        XCTAssertEqual(view.commonButtonType, .primary)
        XCTAssertNotNil(view.defaultBackgroundColor)
        XCTAssertEqual(view.backgroundColor, CommonButton.defaultPrimaryBackgroundColor)
        XCTAssertEqual(view.titleColor(for: .normal), CommonButton.defaultPrimaryTitleColor)
        if !hasLayout {
            XCTAssertEqual(view.layer.cornerRadius, 0)
            XCTAssertEqual(view.layer.borderWidth, 0)
        }

        view.layoutSubviews()
        XCTAssertEqual(view.layer.borderColor, UIColor.clear.cgColor)
        XCTAssertEqual(view.layer.cornerRadius, CommonButton.defaultCornerRadius)
        XCTAssertEqual(view.layer.borderWidth, 0)
    }

}

// MARK: Common Button - Validation Destructive Type State

extension CommonButtonTests {

    func validateDestructiveState(view: CommonButton) {
        XCTAssertEqual(view.commonButtonType, .destructive)
        XCTAssertNotNil(view.defaultBackgroundColor)
        XCTAssertEqual(view.backgroundColor, CommonButton.defaultDestructiveBackgroundColor)
        XCTAssertEqual(view.titleColor(for: .normal), CommonButton.defaultDestructiveTitleColor)
        XCTAssertEqual(view.layer.cornerRadius, 0)
        XCTAssertEqual(view.layer.borderWidth, 0)
        view.layoutSubviews()
        XCTAssertEqual(view.layer.borderColor, UIColor.clear.cgColor)
        XCTAssertEqual(view.layer.cornerRadius, CommonButton.defaultCornerRadius)
        XCTAssertEqual(view.layer.borderWidth, 0)
    }

}

// MARK: Common Button - Validation Secondary Type State

extension CommonButtonTests {

    func validateSecondaryState(view: CommonButton, hasLayout: Bool = false) {
        XCTAssertEqual(view.commonButtonType, .secondary)
        XCTAssertNotNil(view.defaultBackgroundColor)
        XCTAssertEqual(view.backgroundColor, CommonButton.defaultSecondaryBackgroundColor)
        XCTAssertEqual(view.titleColor(for: .normal), CommonButton.defaultSecondaryTitleColor)
        if !hasLayout {
            XCTAssertEqual(view.layer.cornerRadius, 0)
            XCTAssertEqual(view.layer.borderWidth, 0)

        }

        view.layoutSubviews()
        XCTAssertEqual(view.layer.borderColor, UIColor.clear.cgColor)
        XCTAssertEqual(view.layer.cornerRadius, CommonButton.defaultCornerRadius)
        XCTAssertEqual(view.layer.borderWidth, 0)
    }

}
