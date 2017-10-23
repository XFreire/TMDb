//
//  TaggedImage.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 23/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

struct TaggedImage: Decodable {
    let path: String
    let aspectRatio: Double
    
    private enum CodingKeys: String, CodingKey {
        case path = "file_path"
        case aspectRatio = "aspect_ratio"
    }
}
