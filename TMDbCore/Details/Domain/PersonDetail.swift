//
//  PersonDetail.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 23/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

struct PersonDetail: Decodable {
    let biography: String?
    let birthday: String?
    let deathday: String?
    let identifier: Int64
    let name: String
    let profilePath: String?
    let taggedImages: Page<TaggedImage>
    
    private enum CodingKeys: String, CodingKey {
        case biography, birthday, deathday, name
        case identifier = "id"
        case profilePath = "profile_path"
        case taggedImages = "tagged_images"
    }
}
