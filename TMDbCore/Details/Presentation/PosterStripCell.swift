//
//  PosterStripCell.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 20/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import RxSwift

final class PosterStripCell: UICollectionViewCell, ReusableView, NibLoadableView {

    // MARK: - Outlets
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var metadataLabel: UILabel!
    
    // MARK: - Properties
    private(set) var disposeBag = DisposeBag()
    
    // MARK: - Overrides
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterView.image = nil
        disposeBag = DisposeBag()
    }

}
