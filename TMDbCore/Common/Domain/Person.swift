//
//  Person.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 14/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

struct Person: Decodable {
    let identifier: Int64
    let name: String
    let profilePath: String?
    let knownFor: [Media]?

    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case profilePath = "profile_path"
        case knownFor = "known_for"
    }
}
