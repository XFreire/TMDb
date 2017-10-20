//
//  DetailHeaderView.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 20/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import RxSwift

final class DetailHeaderView: UIView, NibLoadableView {
    private enum Constants {
        static let height: CGFloat = 280
    }
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var metadataLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var backdropView: UIImageView!
    
    // MARK: - Properties
    
    let disposeBag = DisposeBag()
    
    // MARK: - Overrides
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: Constants.height)
    }
}
