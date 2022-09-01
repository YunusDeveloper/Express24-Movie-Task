//
//  SessionService.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 31/08/22.
//

import Foundation
import RxSwift

final class SessionService {
    
    private let restClient: BackendRestClient
    
    init( restClient: BackendRestClient) {
        self.restClient = restClient
    }
    
    func getPopularMovies() -> Single<MoviesResponse> {
        let response = restClient.request(SessionEndpoints.GetPopularMovies())
        return response
    }
    
    func getTopratedMovies() -> Single<MoviesResponse> {
        let response = restClient.request(SessionEndpoints.GetTopRatedMovies())
        return response
    }
    
    func getUpcomingMovies() -> Single<MoviesResponse> {
        let response = restClient.request(SessionEndpoints.GetUpcomingMovies())
        return response
    }
    
    func getMovieCast(id: Int) -> Single<MovieCast> {
        let response = restClient.request(SessionEndpoints.GetMovieCast(id: id))
        return response
    }
    
    func getActorMovies(id: Int) -> Single<MovieCast> {
        let response = restClient.request(SessionEndpoints.GetActorMovies(id: id))
        return response
    }
}
