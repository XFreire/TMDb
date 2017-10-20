//
//  DetailSection.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 20/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

struct DetailHeader {
    let title: String
    let metadata: String
    let posterPath: String?
    let backdropPath: String?
}

struct PosterStripItem {
    let identifier: Int64
    let mediaType: MediaType
    
    let title: String
    let metadata: String
    let posterPath: String?
}

enum DetailSection {
    case header(DetailHeader)
    case about(title: String, detail: String)
    case posterStrip(title: String, items: [PosterStripItem])
}
