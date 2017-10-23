//
//  DetailHeader+MovieDetail.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 23/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

extension DetailHeader {
    init(movie: MovieDetail, dateFormatter: DateFormatter) {
        title = movie.title
        posterPath = movie.posterPath
        backdropPath = movie.backdropPath
        
        let releaseDate = movie.releaseDate.flatMap{ dateFormatter.date(from: $0) }
        let year = (releaseDate?.year).flatMap{ String($0) }
        let duration = "\(movie.runtime) min."
        metadata = [year, duration].flatMap{ $0 }.joined(separator: " - ")
    }
}
