//
//  SearchResultsRepository.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 21/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import RxSwift

protocol SearchResulsRepositoryProtocol {
    func searchResults(withQuery query: String, page: Int) -> Observable<[SearchResult]>
}

final class SearchResultsRepository: SearchResulsRepositoryProtocol {
    
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func searchResults(withQuery query: String, page: Int) -> Observable<[SearchResult]> {
        return webService.load(Page<SearchResult>.self, from: .searchResults(query: query, page: page)).map{ $0.results }
    }
    
    
}
