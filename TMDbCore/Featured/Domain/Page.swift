//
//  Page.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 21/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

struct Page<T: Decodable>: Decodable{
    let page: Int
    let totalPages: Int
    let totalResults: Int
    let results: [T]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case results
    }
}
