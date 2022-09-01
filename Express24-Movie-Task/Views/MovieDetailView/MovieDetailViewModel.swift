//
//  MovieDetailViewModel.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 01/09/22.
//

import Foundation
import RxSwift

final class MovieDetailViewModel {
    var movieItem: Cast? = nil
    var movieCast: MovieCast? = nil
    private let sessionService: SessionService
    private let disposeBag = DisposeBag()
    let isDataLoaded = PublishSubject<Bool>()
    
    let showActorDetailSubject = PublishSubject<Cast>()
    
    var go2ActorDetailViewObservable: Observable<Cast> {
        return showActorDetailSubject.asObserver()
    }
    
    init(sessionService: SessionService) {
        self.sessionService = sessionService
    }
    
    func setMovie(_ movie: Cast?) {
        self.movieItem = movie
        
        guard let id = movie?.id else { return }
        getMovieCast(id: id)
    }
    
    func getMovieCast(id: Int) {
        sessionService.getMovieCast(id: id)
            .subscribe(on: ConcurrentMainScheduler.instance)
            .subscribe(onSuccess: { [weak self] castResponse in
                self?.movieCast = castResponse
                self?.isDataLoaded.onNext(true)
            }).disposed(by: disposeBag)
    }
    
    func go2ActorDetailView(cast: Cast) {
        showActorDetailSubject.onNext(cast)
    }
}
