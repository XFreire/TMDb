//
//  PosterStripPresenter.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 20/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import RxSwift
import RxCocoa

final class PosterStripPresenter {
    private let imageRepository: ImageRepositoryProtocol
    
    init(imageRepository: ImageRepositoryProtocol) {
        self.imageRepository = imageRepository
    }

    func present(item: PosterStripItem, in cell: PosterStripCell) {
        bindPoster(at: item.posterPath, to: cell)

        cell.titleLabel.text = item.title
        cell.metadataLabel.text = item.metadata
    }
}

private extension PosterStripPresenter {
    func bindPoster(at path: String?, to cell: PosterStripCell) {
        guard let path = path else {
            return
        }

        imageRepository.image(at: path, size: .w300)
            .observeOn(MainScheduler.instance)
            .bind(to: cell.posterView.rx.image)
            .disposed(by: cell.disposeBag)
    }
}
