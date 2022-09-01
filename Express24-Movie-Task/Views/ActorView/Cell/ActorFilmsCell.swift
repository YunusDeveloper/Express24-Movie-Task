//
//  ActorFilmsCell.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 01/09/22.
//

import UIKit
import AlamofireImage

final class ActorFilmsCell: BaseTableViewCell {
    
    private let contentStackView = UIStackView(axis: .horizontal, distribution: .fill, alignment: .fill, spacing: 8, layoutMargins: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))
    private let filmImageView = UIImageView()
    private let filmName = UILabel()
    
    override func configureAndLayoutSubviews() {
        super.configureAndLayoutSubviews()
        contentView.addSubviews(contentStackView)
        contentView.backgroundColor = .backgroundColor
        filmName.textColor = .white
        contentStackView.addArrangedViews(filmImageView, filmName)
        
        filmImageView.snp.makeConstraints { make in
            make.width.height.equalTo(70)
        }
    }
    
    func setup(_ cast: Cast?) {
        guard let cast = cast else {
            return
        }

        filmName.text = cast.title
        if let url = cast.posterImageURL {
            filmImageView.af.setImage(withURL: url)
        }
    }
}
