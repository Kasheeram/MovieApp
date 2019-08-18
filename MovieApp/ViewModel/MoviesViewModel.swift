//
//  MoviesViewModel.swift
//  MovieApp
//
//  Created by Kashee ram on 8/18/19.
//  Copyright © 2019 Kashee ram. All rights reserved.
//

import Foundation

struct MoviesViewModel {
    let id: Int?
    let title: String?
    let posterPath: String?
    let voteAverage: String?
    
    // Dependency Injection (DI)
    init(results: Result) {
        self.id = results.id
        self.title = results.title
        self.posterPath = results.posterPath
        if let voteAVG = results.voteAverage {
            let votePercentage = Int((voteAVG / 10) * 100)
            self.voteAverage = "\(votePercentage)%"
        } else {
            voteAverage = "0.0"
        }
        
    }
}
