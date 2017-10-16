//
//  SearchAssembly.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 14/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

final class SearchAssembly {
    
    private let imageLoadingAssembly: ImageLoadingAssembly
    
    init(imageLoadingAssembly: ImageLoadingAssembly) {
        self.imageLoadingAssembly = imageLoadingAssembly
    }
    
    func viewController() -> SearchResultsViewController {
        return SearchResultsViewController(presenter: presenter(), resultPresenter: resultPresenter())
    }
    
    func presenter() -> SearchResultsPresenter {
        return SearchResultsPresenter()
    }
    
    func resultPresenter() -> SearchResultCellPresenter{
        return SearchResultCellPresenter(imageRepository: imageLoadingAssembly.imageRepository)
    }
}
