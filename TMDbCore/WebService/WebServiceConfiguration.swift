//
//  WebServiceConfiguration.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 13/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

public struct WebServiceConfiguration {
    public let language: String
    public let apiKey: String
    
    public init(language: String, apiKey: String) {
        self.language = language
        self.apiKey = apiKey
    }
    
    private class Dummy {}
    
    public static let `default` =
        WebServiceConfiguration(language: Bundle.main.preferredLocalizations[0],
                                apiKey: Bundle(for: WebServiceConfiguration.Dummy.self) .infoDictionary?["TMDB_API_KEY"] as? String ?? "")
}

internal extension WebServiceConfiguration {
    var parameters: [String : String] {
        return [
            "api_key" : apiKey,
            "language" : language
        ]
    }
}
