//
//  Constraint.swift
//  BaseProject
//
//  Created by David Thorn on 12.01.20.
//  Copyright © 2020 David Thorn. All rights reserved.
//

import UIKit

public extension UIView {

    @discardableResult
    func constrain() -> Self? {
        guard superview.isNotNil else { return nil }
        
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }

    /// Pins the horizontal and vertical edges to the views superview.
    /// - Parameter insets: Sets the constant / offset property of the constraint.
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

    func pinTop(lessThanOrEqualTo: CGFloat = 0) {
        guard let parentView = constrain()?.superview else { fatalError("View has not been added to parent") }

        NSLayoutConstraint.activate([
            topAnchor.constraint(lessThanOrEqualTo: parentView.layoutMarginsGuide.topAnchor, constant: lessThanOrEqualTo)
        ])
    }

    func pinBottom(constant: CGFloat = 0, priority: UILayoutPriority = .required) {
        guard let parentView = constrain()?.superview else { fatalError("View has not been added to parent") }
        let constraint = bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -abs(constant))
        constraint.priority = priority
        NSLayoutConstraint.activate([
            constraint
        ])
    }
    
    func pinBottom(lessThanOrEqualTo: CGFloat = 0, priority: UILayoutPriority = .required) {
        guard let parentView = constrain()?.superview else { fatalError("View has not been added to parent") }
        let constraint = bottomAnchor.constraint(lessThanOrEqualTo: parentView.bottomAnchor,
                                                 constant: -abs(lessThanOrEqualTo))
        constraint.priority = priority
        NSLayoutConstraint.activate([
            constraint
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

    /// Constrains the views trailing and leading anchor to that of its parents using the insets as constants.
    /// - Parameter insets:  Left and right property are used as the insets.
    func pinHorizontal(insets: UIEdgeInsets = .zero) {
        pinTrailing(constant: -abs(insets.right))
        pinLeading(constant: insets.left)
    }

    /// Constrains the views top and bottom anchor to that of its parents using the insets as constants.
    /// - Parameter insets: Top and bottom property are used as the insets.
    func pinVertical(insets: UIEdgeInsets = .zero) {
        pinTop(constant: insets.top)
        pinBottom(constant: -abs(insets.bottom))
    }

    /// Sets the views trailing anchor to that of it views leading or trailing anchor based upon the edge provided.
    /// - Parameters:
    ///   - view: The view that this views anchor will be constraint to.
    ///   - edge: Either left or right will be used to determine that edge of the view that should be used.
    ///   - constant: The constant 
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

    @discardableResult
    func width(constant: CGFloat) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = widthAnchor.constraint(equalToConstant: constant)
        NSLayoutConstraint.activate([
            constraint
        ])
        return constraint
    }

    @discardableResult
    func width(view: UIView, multiplier: CGFloat = 1) -> NSLayoutConstraint {
        constrain()
        let widthConstraint = widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier)
        widthConstraint.priority = .required
        NSLayoutConstraint.activate([
            widthConstraint
        ])
        return widthConstraint
    }

    @discardableResult
    func height(constant: CGFloat) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = heightAnchor.constraint(equalToConstant: constant)
        NSLayoutConstraint.activate([
            constraint
        ])
        return constraint
    }

    @discardableResult
    func height(view: UIView, multiplier: CGFloat = 1) -> NSLayoutConstraint {
        constrain()
        let heightConstraint = heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier)
        heightConstraint.priority = .required
        NSLayoutConstraint.activate([
            heightConstraint
        ])
        return heightConstraint
    }
    
    func pinTop(view: UIView, edge: UIRectEdge = .bottom, constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch edge {
        case .top:
            NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: constant)
            ])
        case .bottom:
            NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: view.bottomAnchor, constant: constant)
            ])
        default: break
        }
        
    }

    func center(insets: UIEdgeInsets) {
        guard let parentView = constrain()?.superview else { fatalError("View has not been added to parent") }
        
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: parentView.centerXAnchor, constant: insets.left),
            centerYAnchor.constraint(equalTo: parentView.centerYAnchor, constant: insets.top)
        ])
    }
}
