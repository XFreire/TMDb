//
//  FeaturedAssembly.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 19/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

final class FeaturedAssembly {
    private let imageLoadingAssembly: ImageLoadingAssembly
    
    init(imageLoadingAssembly: ImageLoadingAssembly) {
        self.imageLoadingAssembly = imageLoadingAssembly
    }
    
    func cardPresenter() -> CardPresenter {
        return CardPresenter(imageRepository: imageLoadingAssembly.imageRepository)
    }
}
