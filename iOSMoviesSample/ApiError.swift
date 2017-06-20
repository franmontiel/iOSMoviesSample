//
//  APIError.swift
//  iOSMoviesSample
//
//  Created by fj on 20/06/2017.
//  Copyright © 2017 Spiral Apps. All rights reserved.
//

import Foundation

enum ApiError: Error {
    case NetworkError
    case AuthenticationError
    case ServerError
    case GenericError
    
}
