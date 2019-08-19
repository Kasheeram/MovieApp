//
//  CreditsModel.swift
//  MovieApp
//
//  Created by Kashee ram on 8/18/19.
//  Copyright © 2019 Kashee ram. All rights reserved.
//

import Foundation


struct Credits: Decodable {
    let id: Int?
    let cast: [Cast]?
    let crew: [Crew]?
}

// MARK: - Cast
struct Cast: Decodable {
    let castID: Int?
    let character, creditID: String?
    let gender, id: Int?
    let name: String?
    let order: Int?
    let profilePath: String?
    
    
}

// MARK: - Crew
struct Crew: Decodable {
    let creditID, department: String?
    let gender, id: Int?
    let job, name: String?

}


