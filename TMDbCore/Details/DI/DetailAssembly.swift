//
//  File.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 20/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

final class DetailAssembly {
    private let imageLoadingAssembly: ImageLoadingAssembly
    
    init(imageLoadingAssembly: ImageLoadingAssembly) {
        self.imageLoadingAssembly = imageLoadingAssembly
    }
    
    func detailHeaderPresenter() -> DetailHeaderPresenter {
        return DetailHeaderPresenter(imageRepository: imageLoadingAssembly.imageRepository)
    }
    
    func posterStripPresenter() -> PosterStripPresenter {
        return PosterStripPresenter(imageRepository: imageLoadingAssembly.imageRepository)
    }
}
