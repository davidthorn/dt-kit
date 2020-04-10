//
//  Constraint.swift
//  BaseProject
//
//  Created by David Thorn on 12.01.20.
//  Copyright © 2020 David Thorn. All rights reserved.
//

import UIKit

public extension UIView {
    
    func constrain() -> Self? {
        guard superview.isNotNil else { return nil }
        
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    func edgesToSuperview(insets: UIEdgeInsets = .zero) {
        pinHorizontal(insets: insets)
        pinVertical(insets: insets)
    }
    
    func pinTop(constant: CGFloat = 0) {
        guard let parentView = constrain()?.superview else { fatalError("View has not been added to parent") }
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: parentView.topAnchor, constant: constant)
            ])
    }
    
    func pinBottom(constant: CGFloat = 0) {
        guard let parentView = constrain()?.superview else { fatalError("View has not been added to parent") }
        
        NSLayoutConstraint.activate([
            bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -abs(constant))
            ])
    }
    
    func pinBottom(lessThanOrEqualTo: CGFloat = 0) {
        guard let parentView = constrain()?.superview else { fatalError("View has not been added to parent") }
        
        NSLayoutConstraint.activate([
            bottomAnchor.constraint(lessThanOrEqualTo: parentView.bottomAnchor, constant: lessThanOrEqualTo)
            ])
    }
    
    func pinTrailing(constant: CGFloat = 0) {
        guard let parentView = constrain()?.superview else { fatalError("View has not been added to parent") }
        
        NSLayoutConstraint.activate([
            rightAnchor.constraint(equalTo: parentView.rightAnchor, constant: -abs(constant))
            ])
    }
    
    func pinTrailing(greaterThanOrEqualTo: CGFloat = 0) {
        guard let parentView = constrain()?.superview else { fatalError("View has not been added to parent") }
        
        NSLayoutConstraint.activate([
            rightAnchor.constraint(greaterThanOrEqualTo: parentView.rightAnchor, constant: -abs(greaterThanOrEqualTo))
            ])
    }
    
    func pinTrailing(lessThanOrEqualTo: CGFloat = 0) {
        guard let parentView = constrain()?.superview else { fatalError("View has not been added to parent") }
        
        NSLayoutConstraint.activate([
            rightAnchor.constraint(lessThanOrEqualTo: parentView.rightAnchor, constant: -abs(lessThanOrEqualTo))
            ])
    }
    
    func pinLeading(constant: CGFloat = 0) {
        guard let parentView = constrain()?.superview else { fatalError("View has not been added to parent") }
        
        NSLayoutConstraint.activate([
            leftAnchor.constraint(equalTo: parentView.leftAnchor, constant: constant)
            ])
    }
    
    func pinHorizontal(insets: UIEdgeInsets = .zero) {
        pinTrailing(constant: -abs(insets.right))
        pinLeading(constant: insets.left)
    }
    
    func pinVertical(insets: UIEdgeInsets = .zero) {
        pinTop(constant: insets.top)
        pinBottom(constant: -abs(insets.bottom))
    }
    
    func pinTrailing(view: UIView, edge: UIRectEdge = .left, constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch edge {
        case .right:
            NSLayoutConstraint.activate([
                rightAnchor.constraint(equalTo: view.rightAnchor, constant: constant)
                ])
        case .left:
            NSLayoutConstraint.activate([
                rightAnchor.constraint(equalTo: view.leftAnchor, constant: constant)
                ])
        default: break
        }
        
    }
    
    func pinLead(view: UIView, edge: UIRectEdge = .right, constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch edge {
        case .right:
            NSLayoutConstraint.activate([
                leftAnchor.constraint(equalTo: view.rightAnchor, constant: constant)
                ])
        case .left:
            NSLayoutConstraint.activate([
                leftAnchor.constraint(equalTo: view.leftAnchor, constant: constant)
                ])
        default: break
        }
        
    }
    
    func width(constant: CGFloat) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = widthAnchor.constraint(equalToConstant: constant)
        NSLayoutConstraint.activate([
            constraint
            ])
        return constraint
    }
    
    func height(constant: CGFloat) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = heightAnchor.constraint(equalToConstant: constant)
        NSLayoutConstraint.activate([
            constraint
            ])
        return constraint
    }
    
    func pinTop(view: UIView, edge: UIRectEdge = .bottom, constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch edge {
        case .top:
            NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: view.topAnchor, constant: constant)
                ])
        case .bottom:
            NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: view.bottomAnchor, constant: constant)
                ])
        default: break
        }
        
    }
}
