//
//  Credits.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 21/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//


import Foundation

struct Credits: Decodable {
    struct CastMember: Decodable {
        let character: String
        let identifier: Int64
        let name: String
        let profilePath: String? 

        private enum CodingKeys: String, CodingKey {
            case character
            case identifier = "id"
            case name
            case profilePath = "profile_path"
        }
    }

    let cast: [CastMember]
}
