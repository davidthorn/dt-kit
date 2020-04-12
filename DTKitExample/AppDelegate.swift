//
//  AppDelegate.swift
//  DTKitExample
//
//  Created by Thorn, David on 12.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import UIKit
import DTKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        if shouldUseNavigationController() {
            window?.rootViewController = navigationController()
        } else {
            window?.rootViewController = rootViewController()
        }

        window?.makeKeyAndVisible()

        return true
    }

    private func rootViewController() -> UIViewController {
        let initialCredentials = LoginCredentials()
        let loginViewModel = LoginViewModel(credentials: initialCredentials) { receivedCredentials in
            debugPrint(receivedCredentials)
        }
        let viewController = LoginViewController<LoginViewModel>.init(viewModel: loginViewModel)
        viewController.title = "Default View Controller"
        return viewController
    }

    private func shouldUseNavigationController() -> Bool {
        return true
    }

    private func navigationController() -> UINavigationController {
        UINavigationController(rootViewController: rootViewController())
    }

}

