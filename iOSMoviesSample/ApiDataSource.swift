//
//  ApiDataSource.swift
//  iOSMoviesSample
//
//  Created by fj on 20/06/2017.
//  Copyright © 2017 Spiral Apps. All rights reserved.
//

import Foundation
import Alamofire

protocol ApiDataSource {
   static func isNetworkReachable() -> Bool
}

extension ApiDataSource {

    static func isNetworkReachable() -> Bool {
        return Alamofire.NetworkReachabilityManager()?.isReachable ?? false
    }
}
