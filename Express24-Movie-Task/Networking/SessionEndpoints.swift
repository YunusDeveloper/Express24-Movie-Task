//
//  SessionEndpoints.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 31/08/22.
//

import Foundation

enum SessionEndpoints {
    class GetPopularMovies: ApiRequest<MoviesResponse> {
        init() {
            super.init(resource: "movie/popular?api_key=503c07b94a23031d52f4eb6b7c8ce4ce",
                       method: .get)
        }
    }
    
    class GetTopRatedMovies: ApiRequest<MoviesResponse> {
        init() {
            super.init(resource: "movie/top_rated?api_key=503c07b94a23031d52f4eb6b7c8ce4ce",
                       method: .get)
        }
    }
    
    class GetUpcomingMovies: ApiRequest<MoviesResponse> {
        init() {
            super.init(resource: "movie/upcoming?api_key=503c07b94a23031d52f4eb6b7c8ce4ce",
                       method: .get)
        }
    }
    
    class GetMovieCast: ApiRequest<MovieCast> {
        init(id: Int) {
            super.init(resource: "movie/\(id)/credits?api_key=503c07b94a23031d52f4eb6b7c8ce4ce",
                       method: .get)
        }
    }
    
    class GetActorMovies: ApiRequest<MovieCast> {
        init(id: Int) {
            super.init(resource: "person/\(id)//movie_credits?api_key=503c07b94a23031d52f4eb6b7c8ce4ce",
                       method: .get)
        }
    }
}
