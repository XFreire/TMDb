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
    
    func searchNavigator() -> SearchNavigator {
        return PhoneSearchNavigator(viewControllerProvider: self)
    }
    
    func presenter() -> SearchResultsPresenter {
        return SearchResultsPresenter()
    }
    
    func resultPresenter() -> SearchResultCellPresenter{
        return SearchResultCellPresenter(imageRepository: imageLoadingAssembly.imageRepository)
    }
}


extension SearchAssembly: SearchResultsViewControllerProvider {
    func searchResultsViewController() -> SearchResultsViewController {
        return SearchResultsViewController(presenter: presenter(), resultPresenter: resultPresenter())
    }
    
    
}
