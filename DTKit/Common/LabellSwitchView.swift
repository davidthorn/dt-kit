//
//  LabellSwitchView.swift
//  BaseProject
//
//  Created by David Thorn on 12.01.20.
//  Copyright © 2020 David Thorn. All rights reserved.
//

import UIKit

public typealias LabelledSwitchChangeHandler = (_ isOn: Bool) -> Void

public final class LabelledSwitchView: CommonView {
    
    private let switchView = UISwitch()
    private let label = UILabel()
    private var changeHandler: LabelledSwitchChangeHandler?
    
    public var edgeInsets: UIEdgeInsets { return .init(top: 10, left: 10, bottom: 10, right: 10) }
    
    public func setup(labelText: String?, isOn: Bool, onChangeHandler: LabelledSwitchChangeHandler? = nil) {
        label.text = labelText
        switchView.isOn = isOn
        changeHandler = onChangeHandler
    }
    
    override func commonInit() {
        super.commonInit()

        addSubview(label)
        label.pinLeading()
        label.pinTop()
        label.pinBottom(lessThanOrEqualTo: 5)
        
        addSubview(switchView)
        switchView.pinTrailing(constant: 0)
        switchView.pinTop()
        switchView.pinBottom(constant: 0)
        switchView.pinLead(view: label, constant: 10)
        switchView.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)

    }
    
    @objc private func switchValueChanged() {
        changeHandler?(switchView.isOn)
    }
    
}
