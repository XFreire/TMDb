//
//  PersonPresenter.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 23/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import RxSwift

final class PersonPresenter: DetailPresenter {
    
    
    
    private let repository: PersonRepositoryProtocol
    private let identifier: Int64
    private let disposeBag = DisposeBag()
    
    var view: DetailView?
    
    init(repository: PersonRepositoryProtocol, identifier: Int64) {
        self.repository = repository
        self.identifier = identifier
    }

    func didLoad() {
        view?.setLoading(true)
        
        repository.person(withIdentifier: identifier)
            .map{ [weak self] person in
                self?.detailsSections(for: person) ?? []
            }
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] sections in
                self?.view?.update(with: sections)
            }, onDisposed: { [weak self] in
                self?.view?.setLoading(false)
            })
            .disposed(by: disposeBag)
    }
    
    func didSelect(item: PosterStripItem) {
        // Nothing to do
    }
}

private extension PersonPresenter {
    func detailsSections(for person: PersonDetail) -> [DetailSection] {
        var detailSections: [DetailSection] = [
            .header(DetailHeader(person: person))
        ]
        
        if let biography = person.biography {
            detailSections.append(.about(title: "About", detail: biography))
        }
        
        return detailSections
    }
}
