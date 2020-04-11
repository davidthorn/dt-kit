//
//  CommonTextField.swift
//  RegistrationForm
//
//  Created by Thorn, David on 23.03.20.
//  Copyright © 2020 David Thorn. All rights reserved.
//

import UIKit

public final class CommonTextField<T: Hashable & CommonTextFieldViewModelProtocol>: UITextField {

    public typealias ViewModel = T

    private var viewModel: ViewModel?

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("This method should not be called")
    }

    func commonInit() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    public func setup(viewModel: ViewModel) {
        self.viewModel = viewModel
        isSecureTextEntry = viewModel.isSecure
        attributedPlaceholder = viewModel.placeholder
        addTarget(self, action: #selector(textFieldEditingDidBegin), for: .editingDidBegin)
        addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        addTarget(self, action: #selector(textFieldEditingDidEndOnExit), for: .editingDidEndOnExit)

    }

    @objc private func textFieldEditingDidBegin(sender: UITextField) {
        handle(event: .editingDidBegin)
    }

    @objc private func textFieldEditingChanged(sender: UITextField) {
        handle(event: .editingChanged)
    }

    @objc private func textFieldEditingDidEndOnExit(sender: UITextField) {
        handle(event: .editingDidEndOnExit)
    }

    private func handle(event: UIControl.Event) {
        guard let viewModel = viewModel else { return }

        viewModel.textDidChange(text, viewModel, event)
    }

}
