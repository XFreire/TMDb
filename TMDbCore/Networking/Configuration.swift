//
//  Configuration.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 13/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

public struct Configuration: Decodable {
    public struct Images: Decodable {
        public let baseURL: URL
        
        private enum CodingKeys: String, CodingKey {
            case baseURL = "secure_base_url"
        }
    }
    
    public let images: Images
}

public extension Configuration {
    static let `default` = Configuration(images: Images(baseURL: URL(string: "https://image.tmdb.org/t/p/")!))
}
