//
//  ViewController.swift
//  DTKitExample
//
//  Created by Thorn, David on 12.04.20.
//  Copyright © 2020 Thorn, David. All rights reserved.
//

import UIKit
import DTKit

class ViewController: UIViewController {

    let stackView: CommonStackView = .vertical

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        edgesForExtendedLayout = []

        let commonButton: CommonButton = .common
        commonButton.setTitle("Common", for: .normal)

        let disabledButton: CommonButton = .disabled { button in
            button.commonButtonType = .disabled
        }
        disabledButton.setTitle("Disabled", for: .normal)

        let primaryButton: CommonButton = .primary { button in
            disabledButton.commonButtonType = .secondary
        }
        primaryButton.setTitle("Primary", for: .normal)

        let secondaryButton: CommonButton = .secondary { button in
            disabledButton.commonButtonType = .disabled
        }

        secondaryButton.setTitle("Secondary", for: .normal)

        view.addSubview(stackView)
        stackView.pinTop(constant: 20)
        stackView.pinBottom(lessThanOrEqualTo: 20)
        stackView.pinHorizontal(insets: .horizontal(constant: 20))
        stackView.spacing = 30

        stackView.addArrangedSubview(commonButton)
        stackView.addArrangedSubview(primaryButton)
        stackView.addArrangedSubview(secondaryButton)
        stackView.addArrangedSubview(disabledButton)

    }

}

