//
//  PopularViewViewModel.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 31/08/22.
//

import Foundation
import RxSwift

final class MoviesViewViewModel {
    private let sessionService: SessionService
    private let disposeBag = DisposeBag()
    let showMovieDetailSubject = PublishSubject<Cast>()
    let isDataLoaded = PublishSubject<Bool>()
    var navigationTitle = ""
    
    var go2MovieDetailViewObservable: Observable<Cast> {
        return showMovieDetailSubject.asObserver()
    }
    
    lazy var moviesResponse: MoviesResponse? = nil
    
    init(sessionService: SessionService) {
        self.sessionService = sessionService
    }
    
    func getPopularMovies() {
        sessionService.getPopularMovies()
            .subscribe(on: ConcurrentMainScheduler.instance)
            .subscribe(onSuccess: { [weak self] moviesResponse in
                self?.moviesResponse = moviesResponse
                self?.isDataLoaded.onNext(true)
            }).disposed(by: disposeBag)
    }
    
    func getTopratedMovies() {
        sessionService.getTopratedMovies()
            .subscribe(on: ConcurrentMainScheduler.instance)
            .subscribe(onSuccess: { [weak self] moviesResponse in
                self?.moviesResponse = moviesResponse
                self?.isDataLoaded.onNext(true)
            }).disposed(by: disposeBag)
    }

    func getUpcomingMovies() {
        sessionService.getUpcomingMovies()
            .subscribe(on: ConcurrentMainScheduler.instance)
            .subscribe(onSuccess: { [weak self] moviesResponse in
                self?.moviesResponse = moviesResponse
                self?.isDataLoaded.onNext(true)
            }).disposed(by: disposeBag)
    }
    
    func go2MovieDetailView(movie: Cast) {
        showMovieDetailSubject.onNext(movie)
    }
}
