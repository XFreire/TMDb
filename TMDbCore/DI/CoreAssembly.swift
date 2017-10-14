//
//  CoreAssembly.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 14/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

final public class CoreAssembly {
    
    private(set) lazy var searchAssembly = SearchAssembly(imageLoadingAssembly: imageLoadingAssembly)
    private(set) lazy var imageLoadingAssembly = ImageLoadingAssembly(webServiceAssembly: webServiceAssembly)
    private(set) lazy var webServiceAssembly = WebServiceAssembly()
}
