//
//  MovieDataSource.swift
//  iOSMoviesSample
//
//  Created by fj on 19/06/2017.
//  Copyright © 2017 Spiral Apps. All rights reserved.
//

import Alamofire
import Foundation
import ObjectMapper

class ApiMovieDataSource: ApiDataSource {

    static func getUpconming(callback: @escaping (Result<[Movie], ApiError>) -> Void) {

        Alamofire
            .request("https://api.themoviedb.org/3/movie/upcoming?api_key=\(ApiSecret.key)")
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success:
                    if let jsonResponse = response.result.value as? [String: Any] {

                        if let movies = Mapper<Movie>().mapArray(JSONObject: jsonResponse["results"]) {
                            callback(Result(data: movies))
                        }
                    }

                case .failure(let error):
                    print(error)
                    // TODO handle errors
                    if ApiMovieDataSource.isNetworkReachable() {
                    }
                }
            })

    }
}

