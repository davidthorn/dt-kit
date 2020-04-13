//
//  LoginViewController.swift
//  DTKit
//
//  Created by Thorn, David on 11.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import UIKit

final public class LoginViewController<T: EmailPasswordLoginViewModelType>: CommonViewController<T> {

    private lazy var emailPasswordLoginView: EmailPasswordLoginView<T> = {
        guard let viewModel = viewModel else {
            fatalError("Illegal use of LoginViewController, a viewModel must be set.")
        }

        return EmailPasswordLoginView<T>(viewModel: viewModel)
    }()

    public override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(emailPasswordLoginView)
        emailPasswordLoginView.edgesToSuperview()

        emailPasswordLoginView.viewModel?.receivedNewCredentials = { credentials in
            debugPrint("Received new credentials")
        }
    }

}
