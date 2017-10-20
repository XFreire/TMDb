//
//  DetailPresenter.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 20/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

protocol DetailView: class {
    func setLoading(_ loading: Bool)
    func update(with sections: [DetailSection])
}

protocol DetailPresenter: class {
    weak var view: DetailView?{ get set }
    
    func didLoad()
    func didSelect(item: PosterStripItem)
}
