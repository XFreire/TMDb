//
//  Show.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 14/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

struct Show: Decodable {
    let identifier: Int64
    let title: String
    let posterPath: String?
    let backdropPath: String?
    let firstAirDate: Date?
    let genreIdentifiers: [Int]?

    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case title
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genreIdentifiers = "genre_ids"
    }
}