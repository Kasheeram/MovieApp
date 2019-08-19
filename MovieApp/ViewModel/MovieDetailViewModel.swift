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
            let runningTime = secondsToHoursMinutesSeconds(seconds: runtime)
            self.runtime = "\(runningTime.0):\(runningTime.1):\(runningTime.2) hrs"
        } else {
           self.runtime = "N/A"
        }
        self.genres = genre(genres: movieDetails.genres ?? [])
        self.originalLanguage = movieDetails.originalLanguage
        if let voteAVG = movieDetails.voteAverage {
            let votePercentage = Int((voteAVG / 10) * 100)
            self.voteAverage = "\(votePercentage)%"
        } else {
            voteAverage = "0.0"
        }
//        self.voteAverage = "\(movieDetails.voteAverage ?? 0)"
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


func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
    return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
}
