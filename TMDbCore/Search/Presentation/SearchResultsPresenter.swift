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
    
    /// The search query
    let query = Variable("")
    
    /// The search results
    private(set) lazy var searchResults: Observable<[SearchResult]> = Observable
        // TODO: implement
        .just([.movie(Movie(identifier: 330459,
                            title: "Rogue One: A Star Wars Story",
                            posterPath: "/qjiskwlV1qQzRCjpV0cL9pEMF9a.jpg",
                            backdropPath: "/tZjVVIYXACV4IIIhXeIM59ytqwS.jpg",
                            releaseDate: String(describing: Date(timeIntervalSince1970: 1474905532)),
                            genreIdentifiers: [28, 12, 878]))])
    
    init(detailNavigator: DetailNavigator) {
        self.detailNavigator = detailNavigator
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
