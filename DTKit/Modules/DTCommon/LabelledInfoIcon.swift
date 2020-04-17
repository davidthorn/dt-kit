//
//  LabelledInfoIcon.swift
//  BaseProject
//
//  Created by David Thorn on 12.01.20.
//  Copyright © 2020 David Thorn. All rights reserved.
//

import UIKit

public typealias LabelledInfoIconHandler = () -> Void

public final class LabelledInfoIcon: CommonView {
    
    private let imageView = UIImageView()
    private let label = UILabel()
    private lazy var widthConstraint = imageView.width(constant: 0)
    private var iconTapHandler: LabelledInfoIconHandler = { }
    
    public var edgeInsets: UIEdgeInsets { return .init(top: 10, left: 10, bottom: 10, right: 10) }
    
    public func setup(labelText: String?,
                      imageName: String,
                      bundle: Bundle = .main,
                      onIconTapped: LabelledInfoIconHandler? = nil) {
        
        label.text = labelText
        let image = UIImage(named: imageName, in: bundle, compatibleWith: nil)
        widthConstraint.constant = image?.size.width ?? 0
        imageView.image = image
        if let handler = onIconTapped {
            iconTapHandler = handler
        }
    }
    
    override public func commonInit() {
        super.commonInit()

        addSubview(label)
        label.pinLeading()
        label.pinTop(constant: 0)
        label.pinBottom(constant: 0)
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.pinTrailing(lessThanOrEqualTo: 0)
        imageView.pinTop(constant: 0)
        imageView.pinBottom(constant: 0)
        imageView.pinLead(view: label, constant: 10)
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageViewIconTapped))
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
        
    }
    
    @objc private func imageViewIconTapped() {
        iconTapHandler()
    }
    
}
