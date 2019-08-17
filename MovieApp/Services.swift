//
//  Services.swift
//  MovieApp
//
//  Created by Kashee ram on 8/16/19.
//  Copyright © 2019 Kashee ram. All rights reserved.
//

import Foundation
import Alamofire



let apiKey = "aff7482acfc580a62cbe62ee6e73a7a4"
let baseURL = "https://api.themoviedb.org"
let imageBaseUrl = "https://image.tmdb.org/t/p/w500"


struct Service {
    static let shared = Service()
    func fetchGenericData<T: Decodable>(urlString: String, completion: @escaping (T) -> ()) {

//        let hedr = "Bearer \(Token.accessToken)"
//        let header = ["Authorization":hedr]
        AF.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default,headers: nil).validate().responseJSON {
            response in
            switch response.result{
            case .success:
                do {
                    guard let data = response.data else { return }
                    let decoder = JSONDecoder()
//                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let homeFeed = try decoder.decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completion(homeFeed)
                    }
                }catch {

                }
                break
            case .failure(let error):
                print("Failed to serialize json:", error)
            }
        }





    }
}
