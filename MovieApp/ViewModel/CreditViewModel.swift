//
//  CreditViewModel.swift
//  MovieApp
//
//  Created by Kashee ram on 8/18/19.
//  Copyright © 2019 Kashee ram. All rights reserved.
//

import Foundation

struct CreditViewModel {
    let numberOfCasts: String?
    
    init(credits: Credits) {
        let casts = credits.cast
        var actor = ""
        if let casts = casts {
            for i in 0..<casts.count {
                if i < 5 {
                    let cast = casts[i]
                    if actor == "" {
                        actor = "\(cast.name ?? "") (\(cast.character ?? ""))"
                        print(cast.character ?? "")
                    } else {
                        actor += ", \(cast.name ?? "") (\((cast.character ?? "")))"
                    }
                } else {
                    break
                }
            }
            
        }
        self.numberOfCasts = actor
    }
    
}
