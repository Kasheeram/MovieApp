//
//  Model.swift
//  MovieApp
//
//  Created by Kashee ram on 8/16/19.
//  Copyright © 2019 Kashee ram. All rights reserved.
//

import Foundation


//struct HomeFeed: Decodable {
//    let videos: [Video]
//}
//
//struct Video: Decodable {
//    let id: Int
//    let name: String
//    let link: String
//    let imageUrl: String
//    let channel: Channel
//}
//
//struct Channel: Decodable {
//    let name:String?
//    let profileImageUrl:String?
//    let numberOfSubscribers: Int?
//}



//struct Moviews: Decodable {
//    let results: [Result]?
//    
//}
//
//struct Result: Decodable {
//    let voteAverage: Double?
//    let voteCount, id: Int?
//    let video: Bool?
////    let mediaType: MediaType
//    let title: String?
//    let popularity: Double?
//    let posterPath: String?
////    let originalLanguage: ISO639_1
//    let originalTitle: String?
//    let genreIDS: [Int]?
//    let backdropPath: String?
//    let adult: Bool?
//    let overview, releaseDate: String?
//    
//}

//enum MediaType: String, Decodable {
//    case movie = "movie"
//}
//
//enum ISO639_1: String, Decodable {
//    case en = "en"
//}


struct Moviews: Codable {
    let iso639_1: ISO639_1
    let id, page: Int
    let iso3166_1: String
    let totalResults: Int
    let objectIDS: [String: String?]
    let revenue, totalPages: Int
    let name: String
    let welcomePublic: Bool
    let comments: [String: String?]
    let sortBy, welcomeDescription, backdropPath: String
    let results: [Result]
    let averageRating: Double
    let runtime: Int
    let createdBy: CreatedBy
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case iso639_1 = "iso_639_1"
        case id, page
        case iso3166_1 = "iso_3166_1"
        case totalResults = "total_results"
        case objectIDS = "object_ids"
        case revenue
        case totalPages = "total_pages"
        case name
        case welcomePublic = "public"
        case comments
        case sortBy = "sort_by"
        case welcomeDescription = "description"
        case backdropPath = "backdrop_path"
        case results
        case averageRating = "average_rating"
        case runtime
        case createdBy = "created_by"
        case posterPath = "poster_path"
    }
}

// MARK: - CreatedBy
struct CreatedBy: Codable {
    let gravatarHash, name, username, id: String
    
    enum CodingKeys: String, CodingKey {
        case gravatarHash = "gravatar_hash"
        case name, username, id
    }
}

enum ISO639_1: String, Codable {
    case en = "en"
}

// MARK: - Result
struct Result: Codable {
    let voteAverage: Double
    let voteCount, id: Int
    let video: Bool
    let mediaType: MediaType
    let title: String
    let popularity: Double
    let posterPath: String
    let originalLanguage: ISO639_1
    let originalTitle: String
    let genreIDS: [Int]
    let backdropPath: String
    let adult: Bool
    let overview, releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case id, video
        case mediaType = "media_type"
        case title, popularity
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult, overview
        case releaseDate = "release_date"
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
}
