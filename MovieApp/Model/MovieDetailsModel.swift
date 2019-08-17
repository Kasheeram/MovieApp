//
//  MovieDetailsModel.swift
//  MovieApp
//
//  Created by Kashee ram on 8/17/19.
//  Copyright © 2019 Kashee ram. All rights reserved.
//

import Foundation

//struct MovieDetails : Decodable {
//
//    let adult : Bool?
//    let backdropPath : String?
////    let belongsToCollection : AnyObject?
//    let budget : Int?
//    let genres : [MovieDetailsGenre]?
////    let homepage : AnyObject?
//    let id : Int?
//    let imdbId : String?
//    let originalLanguage : String?
//    let originalTitle : String?
//    let overview : String?
//    let popularity : Float?
//    let posterPath : String?
//    let productionCompanies : [MovieDetailsProductionCompany]?
//    let productionCountries : [MovieDetailsProductionCountry]?
//    let releaseDate : String?
//    let revenue : Int?
////    let runtime : AnyObject?
//    let spokenLanguages : [MovieDetailsSpokenLanguage]?
//    let status : String?
//    let tagline : String?
//    let title : String?
//    let video : Bool?
//    let voteAverage : Int?
//    let voteCount : Int?
//
//
//}
//
//
//struct MovieDetailsSpokenLanguage : Decodable {
//
//    let iso6391 : String?
//    let name : String?
//
//}
//
//
//struct MovieDetailsProductionCountry : Decodable {
//
//    let iso31661 : String?
//    let name : String?
//
//}
//
//
//struct MovieDetailsProductionCompany : Decodable {
//
//    let id : Int?
////    let logoPath : AnyObject?
//    let name : String?
//    let originCountry : String?
//
//
//
//}
//
//
//struct MovieDetailsGenre : Decodable {
//
//    let id : Int?
//    let name : String?
//
//
//}





// MARK: - Welcome
struct MovieDetails: Codable {
    let adult: Bool
    let backdropPath: String
    let belongsToCollection: JSONNull?
    let budget: Int
    let genres: [Genre]
    let homepage: String
    let id: Int
    let imdbID, originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath: String
    let productionCompanies: [ProductionCompany]
    let productionCountries: [ProductionCountry]
    let releaseDate: String
    let revenue, runtime: Int
    let spokenLanguages: [SpokenLanguage]
    let status, tagline, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case budget, genres, homepage, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue, runtime
        case spokenLanguages = "spoken_languages"
        case status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

// MARK: - ProductionCompany
struct ProductionCompany: Codable {
    let id: Int
    let logoPath, name, originCountry: String

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}

// MARK: - ProductionCountry
struct ProductionCountry: Codable {
    let iso3166_1, name: String

    enum CodingKeys: String, CodingKey {
        case iso3166_1 = "iso_3166_1"
        case name
    }
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    let iso639_1, name: String

    enum CodingKeys: String, CodingKey {
        case iso639_1 = "iso_639_1"
        case name
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}



