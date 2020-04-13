//
//  EmailPasswordLoginView.swift
//  DTKit
//
//  Created by Thorn, David on 13.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import UIKit

open class EmailPasswordLoginView<T: EmailPasswordLoginViewModelType>: CommonView {

    // MARK: Public Interface

    public typealias ViewModel = T
    public var viewModel: ViewModel?

    // MARK: Private Properties

    private let scrollView = CommonScrollView()
    private let stackViewWrapper = CommonView()
    private let stackView: CommonStackView = .vertical

    // MARK: UI Constants

    public struct Constants: Hashable {
        public let headerViewCenterInsets: UIEdgeInsets
        public let headerViewHorizontalInsets: UIEdgeInsets
        public let headerViewBackgroundColor: UIColor
        public let stackviewSpacing: CGFloat
        public let mainTitleFontSize: CGFloat
        public let mainTitleTextColor: UIColor
        public let mainTitleDefaultText: String

        public init(headerViewCenterInsets: UIEdgeInsets = .init(value: 0),
                    headerViewHorizontalInsets: UIEdgeInsets = .horizontal(constant: 20),
                    headerViewBackgroundColor: UIColor = UIColor.lightGray.withAlphaComponent(0.4),
                    stackviewSpacing: CGFloat = 20,
                    mainTitleFontSize: CGFloat = 18,
                    mainTitleTextColor: UIColor = .black,
                    mainTitleDefaultText: String = "Login") {

            self.headerViewCenterInsets = headerViewCenterInsets
            self.headerViewHorizontalInsets = headerViewHorizontalInsets
            self.headerViewBackgroundColor = headerViewBackgroundColor
            self.stackviewSpacing = stackviewSpacing
            self.mainTitleFontSize = mainTitleFontSize
            self.mainTitleTextColor = mainTitleTextColor
            self.mainTitleDefaultText = mainTitleDefaultText
        }
    }

    public var constants: EmailPasswordLoginView.Constants

    // MARK: Constructors

    public init(viewModel: ViewModel, constants: EmailPasswordLoginView.Constants = Constants()) {
        self.constants = constants
        super.init(frame: .zero)
        self.viewModel = viewModel
        self.constants = constants
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: CommonInit

    public override func commonInit() {
        super.commonInit()

        addSubview(scrollView)
        scrollView.edgesToSuperview()

        scrollView.add(subviews: [stackViewWrapper])
        stackViewWrapper.height(view: scrollView)
        stackViewWrapper.addSubview(headerView)

        headerView.center(insets: constants.headerViewCenterInsets)
        headerView.pinHorizontal(insets: constants.headerViewHorizontalInsets)

        stackView.spacing = constants.stackviewSpacing

        if let subTitle = viewModel?.subtitle {
            stackView.addArrangedSubview(subTitle.containedView)
        }

        stackView.addArrangedSubviews(views: containedViews)

        scrollView.isScrollEnabled = stackViewWrapper.bounds.height > bounds.height

    }

    // MARK: FormFields and FieldInfo

    private lazy var emailFieldInfo: FieldInfo = .email(value: viewModel?.email)
    private lazy var passwordFieldInfo: FieldInfo = .email(value: viewModel?.password)

    private lazy var fieldInfos: [FieldInfo] = {
        [
            emailFieldInfo,
            passwordFieldInfo,
            .saveButton { [weak self] button in
                self?.submitButtonTapHandler(button: button)
            }
        ]
    }()

    private lazy var formFields: [FormField] = fieldInfos.formFields.map { field in
        field.eventHandler = { [weak self] name, value, event in
            self?.textFieldEventHandler(name: name, value: value, event: event)
        }
        return field
    }

    // MARK: TextTypes & NSAttributes

    private lazy var mainTitleAttributed: [NSAttributedString.Key: Any] = [
        .foregroundColor: constants.mainTitleTextColor,
        .font: UIFont.systemFont(ofSize: constants.mainTitleFontSize)
    ]

    private lazy var mainTitleTextType: TextType = {
        viewModel?.mainTitle ?? constants.mainTitleDefaultText.with(attributes: mainTitleAttributed).textType
    }()

    // MARK: Contained Views

    private lazy var containedViews: [ContainedView] = {
        formFields.map { $0.create() }
    }()

    private lazy var headerView: ContainedView = {
        BorderHeaderRepresentation(textType: mainTitleTextType,
                                   headerBackgroundColor: constants.headerViewBackgroundColor,
                                   contentView: stackView).create()
    }()

    // MARK: Single Form Fields & Button

    private var formButton: CommonButton? {
        formFields.saveButton
    }

    public var emailField: FormField? {
        formFields.first(where: { $0.identifier == FormFieldName.email })
    }

    public var passwordField: FormField? {
        formFields.first(where: { $0.identifier == FormFieldName.password })
    }

    // MARK: Submit Button Handler

    private func submitButtonTapHandler(button: CommonButton) {
        guard let credentials = credentials.validate() else { return }

        button.commonButtonType = .disabled
        viewModel?.receivedNewCredentials(credentials)
    }

    // MARK: TextField Event Handling

    private func textFieldEventHandler(name: String, value: String?, event: UIControl.Event) {

        if event == .editingDidEndOnExit {
            handleOnExit(name: name)
        } else {
            formButton?.applyPositiveState()
        }

        if FormFieldName.email == name {
            credentials.email = value
        }

        if FormFieldName.password == name {
            credentials.password = value
        }

    }

    /// Called when one of the text fields has lost focus
    /// - Parameter name: The identfiier of the TextField
    private func handleOnExit(name: String) {
        switch name {
        case FormFieldName.email:
            passwordField?.shouldBecomeFirstResponder()
        default: break
        }
    }

    // MARK: Credentials & Validation & Handling

    private var credentials = ValidateableCredentials<T.Credentials>() {
        didSet { handleNewCredentials(credentials: credentials) }
    }

    private func handleNewCredentials(credentials: ValidateableCredentials<T.Credentials>) {
        if credentials.validate() != nil {
            formButton?.applyPositiveState()
        } else {
            formButton?.commonButtonType = .disabled
        }
    }
}

public extension EmailPasswordLoginView.Constants {



}
