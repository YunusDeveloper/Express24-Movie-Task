//
//  CastResponse.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 01/09/22.
//

import Foundation

struct MovieCast: Codable {
    let id: Int?
    let cast, crew: [Cast]
}

// MARK: - Cast
struct Cast: Codable {
    let adult: Bool?
    let gender, id: Int?
    let knownForDepartment, name, originalName: String?
    let popularity: Double?
    let profilePath: String?
    let castID: Int?
    let character: String?
    let creditID: String?
    let order: Int?
    let department, job: String?
    let backdropPath: String?
    let genreIDS: [Int]?
    let originalLanguage, originalTitle, overview: String?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    var profileImageURL: URL? {
        if let profilePath = profilePath {
            return URL(string: "\(Constants.IMAGE_BASE_URL)\(profilePath)")
        } else {
            return nil
        }
    }
    
    var posterImageURL: URL? {
        if let posterPath = posterPath {
            return URL(string: "\(Constants.IMAGE_BASE_URL)\(posterPath)")
        } else {
            return nil
        }
    }

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case castID = "cast_id"
        case character
        case creditID = "credit_id"
        case order, department, job
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case overview
    }
}
