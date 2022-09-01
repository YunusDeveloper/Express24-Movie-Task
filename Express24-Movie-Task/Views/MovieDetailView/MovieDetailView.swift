//
//  MovieDetailView.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 01/09/22.
//

import UIKit
import AlamofireImage
import RxSwift

final class MovieDetailView: UIViewController {
    
    private let scrollStackView = ScrollStackView(layoutMargins: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16), spacing: 12, isVertical: true)
    private let mainImageView = UIImageView()
    private let movieTitleLabel = UILabel()
    private let movieCreatAtLabel = UILabel()
    private let descrptionLabel = UILabel()
    private let actorsLabel = UILabel()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 12, left: 8, bottom: 0, right: 8)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.backgroundColor
        ActorsCell.register(to: collectionView)
        return collectionView
    }()
    
    private let disposeBag = DisposeBag()
    var viewModel: MovieDetailViewModel? {
        didSet {
            self.setupBindings()
        }
    }
    
    
    override func loadView() {
        super.loadView()
        view.addSubviews(scrollStackView)
        scrollStackView.stackView.addArrangedViews(mainImageView, movieTitleLabel, movieCreatAtLabel, descrptionLabel, actorsLabel, collectionView)
        
        descrptionLabel.numberOfLines = 0
        
        scrollStackView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        mainImageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(250)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(descrptionLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(110)
        }
        
        descrptionLabel.textColor = .white
        movieTitleLabel.textColor = .white
        movieCreatAtLabel.textColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.backgroundColor
        tabBarController?.tabBar.isHidden = true
    }
    
    func setupBindings() {
        guard let viewModel = viewModel else {
            return
        }

        movieTitleLabel.text = viewModel.movieItem?.title
        movieCreatAtLabel.text = viewModel.movieItem?.releaseDate
        descrptionLabel.text = viewModel.movieItem?.overview
        
        if let imageURL = viewModel.movieItem?.posterImageURL {
            mainImageView.af.setImage(withURL: imageURL)
        }
        
        viewModel.isDataLoaded
            .subscribe(onNext: { [weak self] _ in
                self?.collectionView.reloadData()
            }).disposed(by: disposeBag)
    }
}

extension MovieDetailView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.movieCast?.cast.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 100)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ActorsCell.dequeue(on: collectionView, at: indexPath)!
        let cast = viewModel?.movieCast?.cast[indexPath.row]
        cell.setup(cast)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cast = viewModel?.movieCast?.cast[indexPath.row] {
            viewModel?.go2ActorDetailView(cast: cast)
        }
    }
}

