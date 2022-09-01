//
//  ScrollStackView.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 01/09/22.
//

import UIKit
import SnapKit

final class ScrollStackView: UIScrollView {
    private let contentView: UIView = UIView()
    private(set) var stackView: UIStackView
    
    init(layoutMargins: UIEdgeInsets = .zero, spacing: CGFloat = UIStackView.spacingUseDefault, isVertical: Bool = true) {
        stackView = UIStackView(axis: isVertical ? .vertical : .horizontal, distribution: .fill, alignment: .fill, spacing: spacing)
        super.init(frame: .zero)
        stackView.layoutMargins = layoutMargins
        stackView.isLayoutMarginsRelativeArrangement = true
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addSubview(contentView)
        contentView.addSubview(stackView)
        
        contentView.snp.makeConstraints { (make) in
            if stackView.axis == .vertical {
                make.width.equalToSuperview()
            }  else {
                make.height.equalToSuperview()
            }
            make.leading.trailing.bottom.top.equalToSuperview()
        }
        stackView.snp.makeConstraints { (make) in
            make.bottom.top.leading.trailing.equalToSuperview()
        }
    }
}
