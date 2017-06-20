//
//  ErrorMapper.swift
//  iOSMoviesSample
//
//  Created by fj on 20/06/2017.
//  Copyright © 2017 Spiral Apps. All rights reserved.
//

import Foundation

struct ErrorMapper {
    static func map (error: Error) -> String {
        switch error {

        case ApiError.AuthenticationError:
            break
        default:
            break
        }
        return "" // TODO
    }
}
