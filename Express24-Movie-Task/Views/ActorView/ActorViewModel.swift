//
//  ActorViewModel.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 01/09/22.
//

import Foundation
import RxSwift

final class ActorViewModel {
    private let sessionService: SessionService
    private let disposeBag = DisposeBag()
    let isDataLoaded = PublishSubject<Bool>()
    let showMovieDetailSubject = PublishSubject<Cast>()
    
    var go2MovieDetailViewObservable: Observable<Cast> {
        return showMovieDetailSubject.asObserver()
    }
    var actorMovies: MovieCast? = nil
    var actor: Cast? = nil
    
    init(sessionService: SessionService) {
        self.sessionService = sessionService
    }
    
    func getActorMovies(id: Int) {
        sessionService.getActorMovies(id: id)
            .subscribe(on: ConcurrentMainScheduler.instance)
            .subscribe(onSuccess: { [weak self] castResponse in
                self?.actorMovies = castResponse
                self?.isDataLoaded.onNext(true)
            }).disposed(by: disposeBag)
    }
    
    func setActor(_ cast: Cast?) {
        self.actor = cast
        
        if let castID = cast?.id {
            getActorMovies(id: castID)
        }
    }
    
    func go2MovieDetailView(movie: Cast) {
        showMovieDetailSubject.onNext(movie)
    }
}
