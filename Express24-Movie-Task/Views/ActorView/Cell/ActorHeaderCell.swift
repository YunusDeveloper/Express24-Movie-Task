//
//  ActorHeaderCell.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 01/09/22.
//

import UIKit
import AlamofireImage

final class ActorHeaderCell: BaseTableViewCell {
    
    private let actorImageView = UIImageView()
    private let actorName = UILabel()
    private let popularity = UILabel()
    private let contentStackView = UIStackView(axis: .horizontal, distribution: .fill, alignment: .fill, spacing: 0, layoutMargins: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))
    private let VStackView = UIStackView(axis: .vertical, distribution: .fill, alignment: .fill, spacing: 0, layoutMargins: UIEdgeInsets(top: 0, left: 16, bottom: 8, right: 16))
    
    
    override func configureAndLayoutSubviews() {
        super.configureAndLayoutSubviews()
        contentView.addSubviews(contentStackView)
        contentView.backgroundColor = .backgroundColor
        actorName.textColor = .white
        popularity.textColor = .white
        
        contentStackView.addArrangedViews(actorImageView, VStackView)
        VStackView.addArrangedViews(actorName, popularity)
        
        actorImageView.snp.makeConstraints { make in
            make.width.height.equalTo(70)
        }
        
        actorImageView.makeCornerRadius(radius: 12)
    }
    
    
    func setup(_ cast: Cast?) {
        guard let cast = cast else {
            return
        }

        actorName.text = cast.name
        popularity.text = " Popularity \(Int(cast.popularity ?? 0.0))"
        
        if let url = cast.profileImageURL {
            actorImageView.af.setImage(withURL: url)
        }
    }
    
}
