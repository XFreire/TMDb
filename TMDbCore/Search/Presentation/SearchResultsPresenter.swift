//
//  SearchResultsPresenter.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 16/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

import RxSwift

/// Presents search results
final class SearchResultsPresenter {
    
    private let detailNavigator: DetailNavigator
    private let repository: SearchResulsRepositoryProtocol
    
    /// The search query
    let query = Variable("")
    
    /// The search results
    private(set) lazy var searchResults: Observable<[SearchResult]> = query.asObservable()
        .distinctUntilChanged()
        .debounce(0.3, scheduler: MainScheduler.instance)
        .flatMapLatest{ [weak self] query -> Observable<[SearchResult]> in
            guard query.characters.count >= 2, let `self` = self else {
                return Observable.just([])
            }
            return self.repository.searchResults(withQuery: query, page: 1)
        }
        .observeOn(MainScheduler.instance)
        .share(replay: 1)
    
    init(detailNavigator: DetailNavigator, repository: SearchResulsRepositoryProtocol) {
        self.detailNavigator = detailNavigator
        self.repository = repository
    }
    
    /// Called by the view when the user selects a search result
    func didSelect(searchResult: SearchResult) {
        switch searchResult {
        case .show(let show):
            detailNavigator.showDetail(withIdentifier: show.identifier, mediaType: .show)
        case .movie(let movie):
            detailNavigator.showDetail(withIdentifier: movie.identifier, mediaType: .movie)
        case .person(let person):
            detailNavigator.showDetail(withIdentifier: person.identifier, mediaType: .person)
        }
    }
}
