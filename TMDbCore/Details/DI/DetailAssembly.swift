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
    private let navigationController: UINavigationController
    private let webServiceAssembly: WebServiceAssembly
    
    init(imageLoadingAssembly: ImageLoadingAssembly, navigationController: UINavigationController, webServiceAssembly: WebServiceAssembly) {
        self.imageLoadingAssembly = imageLoadingAssembly
        self.navigationController = navigationController
        self.webServiceAssembly = webServiceAssembly
    }
    
    func detailHeaderPresenter() -> DetailHeaderPresenter {
        return DetailHeaderPresenter(imageRepository: imageLoadingAssembly.imageRepository)
    }
    
    func posterStripPresenter() -> PosterStripPresenter {
        return PosterStripPresenter(imageRepository: imageLoadingAssembly.imageRepository)
    }
    
    func detailNavigator() -> DetailNavigator {
        return PhoneDetailNavigator(navigationController: navigationController, viewControllerProvider: self)
    }
    
    func moviePresenter(identifier: Int64) -> DetailPresenter {
        return MoviePresenter(repository: movieRepository(), dateFormatter: webServiceAssembly.dateFormatter, detailNavigator: detailNavigator(), identifier: identifier)
    }
    
    func personPresenter(identifier: Int64) -> DetailPresenter {
        return PersonPresenter(repository: personRepository(), identifier: identifier)
    }
    
    func showPresenter(identifier: Int64) -> DetailPresenter {
        return ShowPresenter(repository: showRepository(), detailNavigator: detailNavigator(), dateFormatter: webServiceAssembly.dateFormatter, identifier: identifier)
    }
    
    func movieRepository() -> MovieRepositoryProtocol {
        return  MovieRepository(webService: webServiceAssembly.webService)
    }
    
    func personRepository() -> PersonRepositoryProtocol {
        return PersonRepository(webService: webServiceAssembly.webService)
    }
    
    func showRepository() -> ShowRepositoryProtocol {
        return ShowRepository(webService: webServiceAssembly.webService)
    }
    
}

extension DetailAssembly: DetailViewControllerProvider {
    
    // FIXME: Temporary!!
    private class DummyDetailPresenter: DetailPresenter {
        var view: DetailView?
        func didLoad() {}
        func didSelect(item: PosterStripItem) {}
    }
    
    func detailViewController(identifier: Int64, mediaType: MediaType) -> UIViewController {
        let presenter: DetailPresenter
        
        switch mediaType {
        case .movie:
            presenter =  moviePresenter(identifier: identifier)
        case .person:
            presenter = personPresenter(identifier: identifier)
        default:
            presenter = showPresenter(identifier: identifier)
        }
        
        return DetailViewController(presenter: presenter,
                                    headerPresenter: detailHeaderPresenter(),
                                    posterStripPresenter: posterStripPresenter())
        
    }
    
    
}
