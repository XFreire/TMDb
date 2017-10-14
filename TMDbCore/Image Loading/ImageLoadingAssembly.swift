//
//  ImageLoadingAssembly.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 14/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation
import Kingfisher

final class ImageRepositoryAssembly {
    private(set) lazy var imageRepository: ImageRepositoryProtocol = ImageRepository(webService: webServiceAssembly.webService, imageManager: KingfisherManager.shared)
    
    private let webServiceAssembly: WebServiceAssembly
    
    init(webServiceAssembly: WebServiceAssembly) {
        self.webServiceAssembly = webServiceAssembly
    }
    
}
