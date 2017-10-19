//
//  CardView.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 19/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import UIKit
import RxSwift

final class CardView: UIView, NibLoadableView {
    private enum Constants {
        static let height: CGFloat = 176
    }
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var metadataLabel: UILabel!
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var tapGestureRecognizer: UITapGestureRecognizer!
    
    // MARK: - Properties
    let disposeBag = DisposeBag()

    // MARK: - Overrides
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: Constants.height)
    }

}
