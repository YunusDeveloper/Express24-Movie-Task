//
//  ActorViewCoordinator.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 01/09/22.
//

import RxSwift

final class ActorViewCoordinator: BaseCoordinator {
    
    private let viewModel: ActorViewModel
    private var actorDetail: Cast? = nil
    private let disposeBag = DisposeBag()
    
    init(viewModel: ActorViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        subscribeEvents()
        
        let vc = ActorView()
        viewModel.setActor(actorDetail)
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
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
    
    func setActorDetail(_ cast: Cast) {
        self.actorDetail = cast
    }
}
