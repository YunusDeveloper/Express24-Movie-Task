//
//  UIStackView+.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 01/09/22.
//

import UIKit

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution? = nil, alignment: UIStackView.Alignment = .fill, spacing:CGFloat = UIStackView.spacingUseDefault) {
        self.init()
        set(axis: axis, distribution: distribution, alignment: alignment, spacing: spacing)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    convenience init(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution? = nil, alignment: UIStackView.Alignment = .fill, spacing:CGFloat = UIStackView.spacingUseDefault, layoutMargins: UIEdgeInsets) {
        self.init()
        set(axis: axis, distribution: distribution, alignment: alignment, spacing: spacing, layoutMargins: layoutMargins)
    }
   
    func set(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution? = nil, alignment: UIStackView.Alignment = .fill, spacing:CGFloat = UIStackView.spacingUseDefault, layoutMargins: UIEdgeInsets? = nil) {
        self.axis = axis
        if let distribution = distribution {
            self.distribution = distribution
        }
        self.alignment = alignment
        self.spacing = spacing
        if let layoutMargins = layoutMargins {
            self.layoutMargins = layoutMargins
            isLayoutMarginsRelativeArrangement = true
        } else {
            self.layoutMargins = .zero
            isLayoutMarginsRelativeArrangement = false
        }
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addArrangedViews(_ views: UIView...) {
        views.forEach { (view) in
            self.addArrangedSubview(view)
        }
    }
}
