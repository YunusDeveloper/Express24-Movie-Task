//
//  UIView+.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 31/08/22.
//

import UIKit

extension UIView {
   
    func top(_ Anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, _ Constraint: CGFloat) {
        self.topAnchor.constraint(equalTo: Anchor, constant: Constraint).isActive = true
    }
    
    func bottom(_ Anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, _ Constraint: CGFloat) {
        self.bottomAnchor.constraint(equalTo: Anchor, constant: Constraint).isActive = true
    }
    
    func Y(_ Anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, _ Constraint: CGFloat) {
        self.centerYAnchor.constraint(equalTo: Anchor, constant: Constraint).isActive = true
    }
    
    
    func left(_ Anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, _ Constraint: CGFloat) {
        self.leftAnchor.constraint(equalTo: Anchor, constant: Constraint).isActive = true
    }
    
    func leading(_ Anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, _ Constraint: CGFloat) {
        self.leadingAnchor.constraint(equalTo: Anchor, constant: Constraint).isActive = true
    }
    
    func trailing(_ Anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, _ Constraint: CGFloat) {
        self.trailingAnchor.constraint(equalTo: Anchor, constant: Constraint).isActive = true
    }
    
    func right(_ Anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, _ Constraint: CGFloat) {
        self.rightAnchor.constraint(equalTo: Anchor, constant: Constraint).isActive = true
    }
    
    func X(_ Anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, _ Constraint: CGFloat) {
        self.centerXAnchor.constraint(equalTo: Anchor, constant: Constraint).isActive = true
    }
    
    func height(_ Constraint: CGFloat) {
        self.heightAnchor.constraint(equalToConstant: Constraint).isActive = true
    }
    
    func width(_ Constraint: CGFloat) {
        self.widthAnchor.constraint(equalToConstant: Constraint).isActive = true
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach { (view) in
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }
    
    func makeCornerRadius(radius:CGFloat) -> Void {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
