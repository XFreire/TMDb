//
//  ShowPresenter.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 23/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import RxSwift

final class ShowPresenter: DetailPresenter {
    
    private let repository: ShowRepositoryProtocol
    private let identifier: Int64
    private let detailNavigator: DetailNavigator
    private let dateFormatter: DateFormatter
    private let disposeBag = DisposeBag()
    
    var view: DetailView?

    init(repository: ShowRepositoryProtocol,  detailNavigator: DetailNavigator, dateFormatter: DateFormatter, identifier: Int64) {
        self.repository = repository
        self.identifier = identifier
        self.detailNavigator = detailNavigator
        self.dateFormatter = dateFormatter
    }
    
    
    func didLoad() {
        repository.show(withIdentifier: identifier)
            .map{ [weak self] show in
                self?.detailSections(for: show) ?? []
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
        detailNavigator.showDetail(withIdentifier: item.identifier, mediaType: .person)
    }
    
    private func detailSections(for show: ShowDetail) -> [DetailSection] {
        
        var detailSections: [DetailSection] = [
            .header(DetailHeader(show: show, dateFormatter: dateFormatter))
        ]

        if let overview = show.overview {
            detailSections.append(.about(title: "Overview", detail: overview))
        }

        let items = show.credits?.cast.map{ PosterStripItem(castMember: $0) }
        if let items = items {
            detailSections.append(.posterStrip(title: "Cast", items: items))
        }


        return detailSections
    }
    
}
