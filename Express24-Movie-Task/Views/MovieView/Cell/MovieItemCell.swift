//
//  MovieItemCell.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 31/08/22.
//

import UIKit
import AlamofireImage

final class MovieItemCell: BaseCollectionViewCell {
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let movieTimeLabel = UILabel()
    
    override func configureAndLayoutSubviews() {
        super.configureAndLayoutSubviews()
        
        contentView.addSubviews(imageView, titleLabel, movieTimeLabel)
        
        imageView.top(topAnchor, 0)
        imageView.leading(leadingAnchor, 0)
        imageView.trailing(trailingAnchor, 0)
        
        titleLabel.top(imageView.bottomAnchor, 4)
        titleLabel.leading(leadingAnchor, 0)
        titleLabel.trailing(trailingAnchor, 0)
        
        movieTimeLabel.top(titleLabel.bottomAnchor, 4)
        movieTimeLabel.leading(leadingAnchor, 0)
        movieTimeLabel.trailing(trailingAnchor, 0)
        
        imageView.image = UIImage(named: "image")
        titleLabel.text = "test"
        movieTimeLabel.text = "test"
        
        titleLabel.numberOfLines = 2
        titleLabel.textColor = .white
        movieTimeLabel.textColor = .white
    }
    
    func reload(_ movie: Cast?) {
        guard let movie = movie else {
            return
        }

        titleLabel.text = movie.title
        movieTimeLabel.text = movie.releaseDate
        
        if let url = movie.posterImageURL {
            imageView.af.setImage(withURL: url)
        }
    }
}
