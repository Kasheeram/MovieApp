//
//  PopularMoviesModel.swift
//  MovieApp
//
//  Created by Kashee ram on 8/18/19.
//  Copyright © 2019 Kashee ram. All rights reserved.
//

import Foundation


struct Moviews: Decodable {
    let page, totalResults, totalPages: Int?
    let results: [Result]?
    
}

// MARK: - Result
struct Result: Decodable {
    //    let voteCount, id: Int?
    let id: Int?
    //    let video: Bool?
    let voteAverage: Double?
    let title: String?
    //    let popularity: Double?
    let posterPath: String?
    //    let originalLanguage: String?
    //    let originalTitle: String?
    //    let genreIDS: [Int]?
    //    let backdropPath: String?
    //    let adult: Bool?
    //    let overview: String?
    
}
