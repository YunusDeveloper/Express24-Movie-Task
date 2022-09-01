//
//  ActorsCell.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 01/09/22.
//

import UIKit
import AlamofireImage

final class ActorsCell: BaseCollectionViewCell {
    
    private let contentStackView = UIStackView(axis: .horizontal, distribution: .fill, alignment: .fill, spacing: 12, layoutMargins: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
    private let actorsImageView = UIImageView()
    private let actorsName = UILabel()
    
    override func configureAndLayoutSubviews() {
        super.configureAndLayoutSubviews()
        contentView.addSubview(contentStackView)
        contentStackView.backgroundColor = UIColor.backgroundColor
        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentStackView.addArrangedViews(actorsImageView)
        
        actorsImageView.snp.makeConstraints { make in
            make.edges.equalTo(contentStackView.snp.edges)
            make.width.height.equalTo(100)
        }
        
        actorsImageView.clipsToBounds = true
        actorsName.textColor = .white
    }
    
    func setup(_ cast: Cast?) {
        guard let cast = cast else {
            return
        }
        
        actorsName.text = cast.name
        
        if let url = cast.profileImageURL {
            actorsImageView.af.setImage(withURL: url)
        }
    }
    
}
