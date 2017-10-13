//
//  Endpoint.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 13/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
}

public protocol Endpoint {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: [String : String] { get }
}

extension Endpoint {
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: [String : String] {
        return [:]
    }
    
    func request(with baseURL: URL, adding parametes: [String : String]) -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        
        var newParameters = self.parameters
        parameters.forEach{ newParameters.updateValue($1, forKey: $0) }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = parameters.isEmpty ? nil : parameters.map(URLQueryItem.init)
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        
        return request
    }
}
