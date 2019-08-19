//
//  MovieDetailsModel.swift
//  MovieApp
//
//  Created by Kashee ram on 8/18/19.
//  Copyright © 2019 Kashee ram. All rights reserved.
//

import Foundation


// MARK: - Welcome
struct MovieDetails: Decodable {
    let adult: Bool?
    let backdropPath: String?
//    let belongsToCollection: JSONNull?
    let budget: Int?
    let genres: [Genre]?
    let homepage: String?
    let id: Int?
    let imdbID, originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [ProductionCompany]?
    let productionCountries: [ProductionCountry]?
    let releaseDate: String?
    let revenue, runtime: Int?
    let spokenLanguages: [SpokenLanguage]?
    let status, tagline, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

}

// MARK: - Genre
struct Genre: Decodable {
    let id: Int?
    let name: String?
}

// MARK: - ProductionCompany
struct ProductionCompany: Decodable {
    let id: Int?
    let logoPath, name, originCountry: String?

}

// MARK: - ProductionCountry
struct ProductionCountry: Decodable {
    let iso3166_1, name: String?

}

// MARK: - SpokenLanguage
struct SpokenLanguage: Decodable {
    let iso639_1, name: String?
    
}

