//
//  MovieDetailCoordinator.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 01/09/22.
//

import UIKit
import RxSwift

final class MovieDetailCoordinator: BaseCoordinator {
    
    private let viewModel: MovieDetailViewModel
    private let disposeBag = DisposeBag()
    private var movieDetail: Cast? = nil
    
    
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        subscribeEvents()
        
        let viewController = MovieDetailView()
        viewModel.setMovie(movieDetail)
        viewController.viewModel = viewModel
        navigationController.navigationBar.tintColor = .white
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func subscribeEvents() {
        viewModel.go2ActorDetailViewObservable
            .subscribe(onNext: { [weak self] cast in
                guard let self = self else { return }

                guard let actorDetailCoordinator = AppDelegate.container.resolve(ActorViewCoordinator.self) else { return }
                actorDetailCoordinator.navigationController = self.navigationController
                actorDetailCoordinator.setActorDetail(cast)
                
                self.start(coordinator: actorDetailCoordinator)
            }).disposed(by: disposeBag)
    }
    
    func setMovieDetail(_ movie: Cast) {
        self.movieDetail = movie
    }
}
