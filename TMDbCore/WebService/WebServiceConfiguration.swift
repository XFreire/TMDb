//
//  WebServiceConfiguration.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 13/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

internal struct WebServiceConfiguration {
    public let language: String
    public let apiKey: String
    
    private class Dummy {}
    
    static let `default` = WebServiceConfiguration(language: Bundle.main.preferredLocalizations[0],
         apiKey: Bundle(for: WebServiceConfiguration.Dummy.self).infoDictionary?["TMDB_API_KEY"] as? String ?? "")

    var parameters: [String : String] {
        return [
            "api_key" : apiKey,
            "language" : language
        ]
    }
}
