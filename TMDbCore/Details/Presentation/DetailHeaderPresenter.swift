//
//  DetailHeaderPresenter.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 20/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import RxCocoa
import RxSwift

final class DetailHeaderPresenter {
    private let imageRepository: ImageRepositoryProtocol
    
    init(imageRepository: ImageRepositoryProtocol) {
        self.imageRepository = imageRepository
    }
    
    func present(header: DetailHeader, in view: DetailHeaderView) {
        bindBackdrop(at: header.backdropPath, to: view)
        bindPoster(at: header.posterPath, to: view)
        
        view.titleLabel.text = header.title.uppercased()
        view.metadataLabel.text = header.metadata
    }
}

private extension DetailHeaderPresenter {
    func bindBackdrop(at path: String?, to view: DetailHeaderView) {
        guard let path = path else { return }
        
        imageRepository.image(at: path, size: .w780)
            .observeOn(MainScheduler.instance)
            .bind(to: view.backdropView.rx.image)
            .disposed(by: view.disposeBag)
    }
    
    func bindPoster(at path: String?, to view: DetailHeaderView) {
        guard let path = path else { return }
        
        imageRepository.image(at: path, size: .w780)
            .observeOn(MainScheduler.instance)
            .bind(to: view.posterView.rx.image)
            .disposed(by: view.disposeBag)
    }
}
