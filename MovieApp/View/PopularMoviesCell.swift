//
//  PopularMoviesCell.swift
//  MovieApp
//
//  Created by Kashee ram on 8/18/19.
//  Copyright © 2019 Kashee ram. All rights reserved.
//

import UIKit

class PopularMoviesCell: NowPlayingMoviesCell {
    
    override func getMoviesList() {
        let urlString = baseURL + "/3/movie/popular?api_key=\(apiKey)&page=\(page)"
        Service.shared.fetchGenericData(urlString: urlString) { (list: Moviews) in
            if let results = list.results, let totalResult =  list.totalResults{
                self.moviesViewModel += results.map({ return MoviesViewModel(results: $0)})
                self.totalEntries = totalResult
            }
            self.movieListCollection.reloadData()
        }
    }
}
