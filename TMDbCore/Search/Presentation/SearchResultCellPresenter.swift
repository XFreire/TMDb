//
//  SearchResultPresenter.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 14/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import RxSwift

/// Presents search results in cells
final class SearchResultCellPresenter {
    private let imageRepository: ImageRepositoryProtocol
    
    init(imageRepository: ImageRepositoryProtocol) {
        self.imageRepository = imageRepository
    }
    
    func present(searchResult: SearchResult, in cell: SearchResultCell) {
        switch searchResult {
        case let .movie(movie):
            present(movie: movie, in: cell)
        case let .show(show):
            present(show: show, in: cell)
        case let .person(person):
            present(person: person, in: cell)
        }
    }
}

private extension SearchResultCellPresenter {
    func present(movie: Movie, in cell: SearchResultCell) {
        bindImage(at: movie.posterPath, to: cell)
        
        cell.headlineLabel.text = NSLocalizedString("MOVIE", comment: "")
        cell.titleLabel.text = movie.title
        
        let metadata = (movie.releaseDate?.year).flatMap { String($0) } ?? ""
        cell.metadataLabel.text = metadata
        cell.metadataLabel.isHidden = metadata.isEmpty
    }
    
    func present(show: Show, in cell: SearchResultCell) {
        bindImage(at: show.posterPath, to: cell)
        
        cell.headlineLabel.text = NSLocalizedString("TV SHOW", comment: "")
        cell.titleLabel.text = show.title
        
        let metadata = (show.firstAirDate?.year).flatMap { String($0) } ?? ""
        cell.metadataLabel.text = metadata
        cell.metadataLabel.isHidden = metadata.isEmpty
    }
    
    func present(person: Person, in cell: SearchResultCell) {
        bindImage(at: person.profilePath, to: cell)
        
        cell.headlineLabel.text = NSLocalizedString("PERSON", comment: "")
        cell.titleLabel.text = person.name
        
        let metadata = person.knownFor?.first
            .flatMap { media -> (String, Date?) in
                switch media {
                case .movie(let movie):
                    return (movie.title, movie.releaseDate)
                case .show(let show):
                    return (show.title, show.firstAirDate)
                }
            }
            .map { title, date in
                if let year = date?.year {
                    return "\(title) (\(year))"
                }
                return title
            } ?? ""
        
        cell.metadataLabel.text = metadata
        cell.metadataLabel.isHidden = metadata.isEmpty
    }
    
    func bindImage(at path: String?, to cell: SearchResultCell) {
        guard let path = path else {
            return
        }
        
        imageRepository.image(at: path, size: .w154)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { cell.posterView.image = $0 })
            .disposed(by: cell.disposeBag)
    }
}
