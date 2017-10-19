//
//  ReusableView.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 14/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import UIKit

protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {

    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
