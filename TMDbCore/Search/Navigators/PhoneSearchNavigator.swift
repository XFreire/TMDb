//
//  PhoneSearchNavigator.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 21/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

final class PhoneSearchNavigator: SearchNavigator {
    
    private unowned let viewControllerProvider: SearchResultsViewControllerProvider
    private var searchController: UISearchController!
    
    init(viewControllerProvider: SearchResultsViewControllerProvider){
        self.viewControllerProvider = viewControllerProvider
    }
    
    func installSearch(viewController: UIViewController) {
        let resultsViewController = viewControllerProvider.searchResultsViewController()
        searchController = UISearchController(searchResultsController: resultsViewController)
        
        searchController.searchResultsUpdater = resultsViewController
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = NSLocalizedString("Search", comment: "")
        searchController.searchBar.searchBarStyle = .minimal
        
        viewController.navigationItem.titleView = searchController.searchBar
        viewController.definesPresentationContext = true
    }
}
