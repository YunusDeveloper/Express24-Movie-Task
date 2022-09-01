//
//  PopularView.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 31/08/22.
//

import UIKit
import RxSwift

final class MoviesView: UIViewController {
    
    private let disposeBag = DisposeBag()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 32, left: 8, bottom: 0, right: 8)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        MovieItemCell.register(to: collectionView)
        return collectionView
    }()
    
    var viewModel: MoviesViewViewModel? {
        didSet {
            self.setupBindings()
        }
    }
    
    override func loadView() {
        super.loadView()
        view.addSubviews(collectionView)
        collectionView.backgroundColor = UIColor.backgroundColor
        
        collectionView.top(view.topAnchor, 0)
        collectionView.leading(view.leadingAnchor, 0)
        collectionView.trailing(view.trailingAnchor, 0)
        collectionView.bottom(view.bottomAnchor, 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.backgroundColor
        title = viewModel?.navigationTitle ?? ""
        print("start")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    func setupBindings() {
        guard let viewModel = viewModel else {
            return
        }
        
        viewModel.isDataLoaded
            .subscribe(onNext: { [weak self] _ in
                self?.collectionView.reloadData()
            }).disposed(by: disposeBag)
    }
}

extension MoviesView: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.moviesResponse?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 18 - 18) / 2.0
        
        return CGSize(width: width, height: 320)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = MovieItemCell.dequeue(on: collectionView, at: indexPath)!
        let movie = viewModel?.moviesResponse?.results[indexPath.row]
        cell.reload(movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let movie = viewModel?.moviesResponse?.results[indexPath.row] {
            viewModel?.go2MovieDetailView(movie: movie)
        }
       
    }
}
