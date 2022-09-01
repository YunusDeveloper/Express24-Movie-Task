//
//  PopularViewCoordinator.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 31/08/22.
//

import RxSwift
import UIKit

final class MoviesViewCoordinator: BaseCoordinator {
    private let viewModel: MoviesViewViewModel
    private let disposeBag = DisposeBag()
    
    init(viewModel: MoviesViewViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        subscribeEvents()
        
        let viewController = MoviesView()
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func subscribeEvents() {
        viewModel.go2MovieDetailViewObservable
            .subscribe(onNext: { [weak self] movieDetail in
                guard let self = self else { return }

                guard let movieDetailCoordinator = AppDelegate.container.resolve(MovieDetailCoordinator.self) else { return }
                movieDetailCoordinator.navigationController = self.navigationController
                movieDetailCoordinator.setMovieDetail(movieDetail)
                
//                self.removeChildCoordinators()
                self.start(coordinator: movieDetailCoordinator)
            }).disposed(by: disposeBag)
    }
    
    func log() {
        print("Log")
    }
    
    func loadPopularMovies() {
        viewModel.getPopularMovies()
    }
    
    func loadUpcomingMovies() {
        viewModel.getUpcomingMovies()
    }
    
    func setNavTitle(_ title: String) {
        viewModel.navigationTitle = title
    }
    
    func loadToprated() {
        viewModel.getTopratedMovies()
    }
}
