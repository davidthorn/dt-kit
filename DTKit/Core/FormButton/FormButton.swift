//
//  FormButton.swift
//  RegistrationForm
//
//  Created by David Thorn on 23.03.20.
//  Copyright © 2020 David Thorn. All rights reserved.
//

import UIKit

public final class FormButton<T: Hashable & FormButtonViewModelProtocol>: CommonControl {
    
    public typealias ViewModel = T
    
    private let label = UILabel()
    
    private var viewModel: ViewModel?
    
    override public func commonInit() {
        super.commonInit()
        
        label.textAlignment = .center
        label.setContentHuggingPriority(.required, for: .vertical)
        addSubview(label)
        addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        applyConstraints()
    }
    
    public func setup(viewModel: ViewModel) {
        guard viewModel != self.viewModel else { return }
        
        self.viewModel = viewModel
        label.attributedText = viewModel.labelText
    }
    
    @objc private func buttonWasTapped(sender: UIControl) {
        viewModel?.tapHandler()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 5
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 1
        backgroundColor = .systemBlue
        label.textColor = .white
    }
    
    private func applyConstraints() {
        label.edgesToSuperview(insets: .init(horizontal: 15, vertical: 15))
    }
    
}
