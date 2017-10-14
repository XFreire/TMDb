//
//  ImageRepository.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 14/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher

public protocol ImageRepositoryProtocol {
    func image(at path: String, size: ImageSize) -> Observable<UIImage>
}

internal protocol ImageManager {
    func image(withURL url: URL) -> Observable<UIImage>
}

extension KingfisherManager: ImageManager {
    func image(withURL url: URL) -> Observable<UIImage> {
        return Observable.create{ observer in
            let task = self.retrieveImage(with: ImageResource(downloadURL: url), options: nil, progressBlock: nil){ image, error, _, _ in
                if let error = error {
                    observer.onError(error)
                }
                else {
                    observer.onNext(image ?? UIImage())
                    observer.onCompleted()
                }
            }
            return Disposables.create {
                task.cancel()
            }
        }
    }
}

final internal class ImageRepository: ImageRepositoryProtocol {
    private let baseURL: Observable<URL>
    private let imageManager: ImageManager
    
    init(webService: WebService, imageManager: ImageManager) {
        self.baseURL = webService.load(Configuration.self, from: .configuration)
            .catchErrorJustReturn(.default)
            .map{ $0.images.baseURL }
            .share(replay: 1)
        
        self.imageManager = imageManager
    }
    
    func image(at path: String, size: ImageSize) -> Observable<UIImage> {
        let imageManager = self.imageManager
        
        return baseURL
            .map { $0.appendingPathComponent(size.rawValue).appendingPathComponent(path) }
            .flatMap { imageManager.image(withURL: $0) }
    }
}
