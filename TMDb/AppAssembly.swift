//
//  AppAssembly.swift
//  TMDb
//
//  Created by Alexandre Freire García on 21/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation
import TMDbCore

final class AppAssembly {
    private(set) lazy var window = UIWindow(frame: UIScreen.main.bounds)
    private(set) lazy var navigationController = UINavigationController(rootViewController: coreAssembly.featuredAssembly.viewController())
    private(set) lazy var coreAssembly = CoreAssembly()
}
