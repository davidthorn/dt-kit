//
//  LoginViewController.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import UIKit

final public class LoginViewController<T: LoginViewModelType>: CommonViewController<T> {

    private let mainTitle = "Login".with(attributes: [
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)
        ]).textType

    private let subTitle = "Please enter your credentials in the fields below to authenticate.".containedView

    private let scrollView = CommonScrollView()
    private let containerView = CommonView()
    private let stackViewWrapper = CommonView()
    private let stackView: CommonStackView = .vertical
    private lazy var headerView: ContainedView = {
        BorderHeaderRepresentation(textType: mainTitle,
                                   headerBackgroundColor: .red,
                                   contentView: stackView).create()
    }()

    private var credentials = ValidateableCredentials<LoginCredentials>() {
        didSet {

            if credentials.validate() != nil {
                formButton?.applyPositiveState()
            } else {
                formButton?.commonButtonType = .disabled
            }
        }
    }

    private lazy var fieldInfos: [FieldInfo] = {
        [
            .email(value: viewModel?.email),
            .password(value:viewModel?.password),
            .saveButton { [weak self] button in
                guard let credentials = self?.credentials.validate() else { return }

                button.commonButtonType = .disabled
                self?.viewModel?.receivedNewCredentials(credentials)
            }
        ]
    }()

    private lazy var formFields: [FormField] = {
        self.fieldInfos.formFields
    }()

    private lazy var containedViews: [ContainedView] = {
        self.formFields.map { $0.create() }
    }()

    private var emailField: FormField? {
        guard let email = formFields.first(where: { $0.identifier == FormFieldName.email }) else { return nil }

        return email
    }

    private var passwordField: FormField? {
        guard let password = formFields.first(where: { $0.identifier == FormFieldName.password }) else { return nil }

        return password
    }

    private var formButton: CommonButton? {
        formFields.saveButton
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        edgesForExtendedLayout = []

        view.addSubview(scrollView)
        
        scrollView.edgesToSuperview()
        scrollView.backgroundColor = .clear
        scrollView.addSubview(containerView)

        containerView.edgesToSuperview()
        containerView.backgroundColor = .white
        containerView.width(view: scrollView)
        containerView.addSubview(headerView)

        headerView.center(insets: .init(top: 0, left: 0, bottom: 0, right: 0))
        headerView.pinHorizontal(insets: .horizontal(constant: 20))

        stackView.spacing = 20
        stackView.addArrangedSubviews(views: [
            subTitle
        ])
        stackView.addArrangedSubviews(views: containedViews)

        formFields.forEach { field in
            field.eventHandler = { [weak self] name, value, event in
                self?.textFieldEventHandler(name: name, value: value, event: event)
            }
        }

        stackView.layoutIfNeeded()

        if stackView.bounds.height > view.bounds.height {
            containerView.height(constant: stackView.bounds.height)
            scrollView.isScrollEnabled = true
            scrollView.contentSize = containerView.bounds.size
        } else {
            scrollView.isScrollEnabled = false
            containerView.height(view: scrollView)
            scrollView.contentSize = containerView.bounds.size
        }
        
    }

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

    private func handleOnExit(name: String) {
        switch name {
        case FormFieldName.email:
            passwordField?.shouldBecomeFirstResponder()
        default: break
        }
    }

}
