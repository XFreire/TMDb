//
//  WebServiceAssembly.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 14/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

final class WebServiceAssembly {
    private(set) lazy var webService = WebService(configuration: .default)
}
