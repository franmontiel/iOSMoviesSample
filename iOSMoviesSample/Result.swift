//
//  DataSourceResponse<T>.swift
//  iOSMoviesSample
//
//  Created by fj on 20/06/2017.
//  Copyright © 2017 Spiral Apps. All rights reserved.
//

import Foundation

enum Result<Data, Error: Swift.Error> {
    case success(Data)
    case failure(Error)

    public init(data: Data) {
        self = .success(data)
    }

    init(error: Error) {
        self = .failure(error)
    }
    
    // TODO hasMoreData
}
