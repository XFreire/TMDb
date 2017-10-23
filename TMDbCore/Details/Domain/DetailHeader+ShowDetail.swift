//
//  DetailHeader+ShowDetail.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 23/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

extension DetailHeader {
    init(show: ShowDetail, dateFormatter: DateFormatter) {
        title = show.title
        posterPath = show.posterPath
        backdropPath = show.backdropPath
        
        let firstAirDate = show.firstAirDate.flatMap{ dateFormatter.date(from: $0) }
        let year = (firstAirDate?.year).flatMap{ String($0) }
        let numberOfSeasons = "\(show.numberOfSeasons) seasons."
        metadata = [year, numberOfSeasons].flatMap{ $0 }.joined(separator: " - ")
    }
}
