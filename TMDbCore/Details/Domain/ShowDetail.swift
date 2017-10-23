//
//  ShowDetail.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 23/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

struct ShowDetail: Decodable {
    let backdropPath: String?
    let identifier: Int64
    let overview: String?
    let posterPath: String?
    let firstAirDate: String?
    let numberOfSeasons: Int
    let title: String
    let credits: Credits?
    
    private enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case identifier = "id"
        case overview
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case numberOfSeasons = "number_of_seasons"
        case title = "name"
        case credits
    }
}
