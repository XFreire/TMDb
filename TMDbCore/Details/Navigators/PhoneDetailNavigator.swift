//
//  PhoneDetailNavigator.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 21/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import UIKit

final class PhoneDetailNavigator: DetailNavigator {
    
    // MARK: - Properties
    private let navigationController: UINavigationController
    private unowned let viewControllerProvider: DetailViewControllerProvider
    
    init(navigationController: UINavigationController, viewControllerProvider: DetailViewControllerProvider) {
        self.navigationController = navigationController
        self.viewControllerProvider = viewControllerProvider
    }
    
    func showDetail(withIdentifier identifier: Int64, mediaType: MediaType) {
        let viewController = viewControllerProvider.detailViewController(identifier: identifier, mediaType: mediaType)
        navigationController.pushViewController(viewController, animated: true)
    }
}
