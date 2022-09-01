//
//  MovieResponse.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 31/08/22.
//

import Foundation

struct MoviesResponse: Codable {
    let page: Int
    let results: [Cast]
    let totalPages, totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct MovieResponse: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    var imageURL: URL? {
        return URL(string: "\(Constants.IMAGE_BASE_URL)\(posterPath)")
    }
    
    var backdropImageURL: URL? {
        return URL(string: "\(Constants.IMAGE_BASE_URL)\(backdropPath)")
    }
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
