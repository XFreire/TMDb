//
//  TaggedImage.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 23/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

struct TaggedImage: Decodable {
    enum ImageType: String, Decodable {
        case poster, backdrop, still
    }
    
    let path: String
    let imageType: ImageType
    
    private enum CodingKeys: String, CodingKey {
        case path = "file_path"
        case imageType = "image_type"
    }
}
