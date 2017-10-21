//
//  DetailNavigator.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 21/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

protocol DetailNavigator {
    func showDetail(withIdentifier identifier: Int64, mediaType: MediaType)
}


