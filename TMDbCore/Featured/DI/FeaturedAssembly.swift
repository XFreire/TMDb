//
//  FeaturedAssembly.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 19/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

final public class FeaturedAssembly {
    private let imageLoadingAssembly: ImageLoadingAssembly
    private let detailAssembly: DetailAssembly
    private let searchAssembly: SearchAssembly
    private let webServiceAssembly: WebServiceAssembly
    
    init(imageLoadingAssembly: ImageLoadingAssembly, detailAssembly: DetailAssembly, searchAssembly: SearchAssembly, webServiceAssembly: WebServiceAssembly) {
        self.imageLoadingAssembly = imageLoadingAssembly
        self.detailAssembly = detailAssembly
        self.searchAssembly = searchAssembly
        self.webServiceAssembly = webServiceAssembly
    }
    
    public func viewController() -> UIViewController {
        return FeaturedViewController(presenter: presenter(), cardPresenter: cardPresenter(), searchNavigator: searchAssembly.searchNavigator())
    }
    
    func presenter() -> FeaturedPresenter {
        return FeaturedPresenter(detailNavigator: detailAssembly.detailNavigator(), repository: featuredRepository())
    }
    
    func featuredRepository() -> FeaturedRepositoryProtocol {
        return FeaturedRepository(webService: webServiceAssembly.webService)
    }
    
    func cardPresenter() -> CardPresenter {
        return CardPresenter(imageRepository: imageLoadingAssembly.imageRepository, dateFormatter: webServiceAssembly.dateFormatter)
    }
}
