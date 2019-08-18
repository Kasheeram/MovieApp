//
//  MovieDetailsViewModel.swift
//  MovieApp
//
//  Created by Kashee ram on 8/18/19.
//  Copyright © 2019 Kashee ram. All rights reserved.
//

import Foundation

struct MoviewDetailViewModel {
    
    let posterPath: String?
    let originalTitle: String?
    let releaseDate: String?
    let runtime: String?
    let genres: String?
    let originalLanguage: String?
    let voteAverage: String?
    let voteCount: String?
    let overview: String?
    
    // Dependency Injection (DI)
    init(movieDetails: MovieDetails) {
        self.posterPath = movieDetails.posterPath
        self.originalTitle = movieDetails.originalTitle
        self.releaseDate = movieDetails.releaseDate
        if let runtime = movieDetails.runtime {
            self.runtime = "\(Double(runtime / 60))"
        } else {
           self.runtime = "N/A"
        }
        self.genres = genre(genres: movieDetails.genres ?? [])
        self.originalLanguage = movieDetails.originalLanguage
        self.voteAverage = "\(movieDetails.voteAverage ?? 0)"
        self.voteCount = "\(movieDetails.voteCount ?? 0)"
        self.overview = movieDetails.overview
    }
    
    
}

func genre(genres: [Genre]) -> String {
    var gens = ""
    for gen in genres {
        if gens == "" {
            gens = gen.name ?? ""
        } else {
            gens += ", \(gen.name ?? "")"
        }
    }

    return gens
}
