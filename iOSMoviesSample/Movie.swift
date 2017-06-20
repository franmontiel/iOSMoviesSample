//
//  File.swift
//  iOSMoviesSample
//
//  Created by fj on 17/06/2017.
//  Copyright © 2017 Spiral Apps. All rights reserved.
//

import Foundation
import ObjectMapper

struct Movie {

    var id: Int
    var title: String
    var overview: String?
    var poster: String?
}

// Using an extension will allow me to not lose the default init
extension Movie: Mappable {
    init?(map: Map) {
        guard map.JSON["id"] != nil,
            map.JSON["title"] != nil else {
                return nil
        }
        self.id = 0
        self.title = ""
    }

    mutating func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        overview <- map["overview"]
        poster <- map["poster_path"]
    }

}
