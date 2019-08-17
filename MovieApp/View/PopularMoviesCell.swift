//
//  PopularMoviesCell.swift
//  MovieApp
//
//  Created by Kashee ram on 8/17/19.
//  Copyright © 2019 Kashee ram. All rights reserved.
//

import UIKit

class PopularMoviesCell: NowPlayingMoviesCell {
    
    override func getMoviesList() {
        let urlString = baseURL + "/3/movie/popular?api_key=\(apiKey)&page=\(page)"
        Service.shared.fetchGenericData(urlString: urlString) { (list: Moviews) in
            if let result = list.results, let totalResult =  list.totalResults {
                self.results += result
                self.totalEntries = totalResult
            }
            self.movieListCollection.reloadData()
        }
    }
}
