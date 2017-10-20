//
//  FeaturedViewController.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 20/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FeaturedViewController: UIViewController {
   
    // MARK: - Outlets
    @IBOutlet weak var showsLabel: UILabel!
    
    @IBOutlet weak var showsStackView: UIStackView!
    
    @IBOutlet weak var moviesLabel: UILabel!
    
    @IBOutlet weak var moviesStackView: UIStackView!
    
    // MARK: - Properties
    private let presenter: FeaturedPresenter
    private let cardPresenter: CardPresenter
    private let disposeBag = DisposeBag()
    
    // MARK: - Initialization
    init(presenter: FeaturedPresenter, cardPresenter: CardPresenter) {
        self.presenter = presenter
        self.cardPresenter = cardPresenter
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.view = self
        presenter.didLoad()
    }
}

extension FeaturedViewController: FeaturedView {
   
    func setShowsHeaderTitle(_ title: String) {
        showsLabel.text = title
    }
    
    func setMoviesHeaderTitle(_ title: String) {
        moviesLabel.text = title
    }
    
    func update(with shows: [Show]) {
        showsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        let cardViews: [UIView] = shows.map { show in
            let cardView = CardView.instantiate()
            cardPresenter.present(show: show, in: cardView)
            cardView.tapGestureRecognizer.rx.event
                .subscribe(onNext: { [weak self] _ in
                    self?.presenter.didSelect(show: show)
                })
                .disposed(by: disposeBag)
            
            return cardView
        }
        
        cardViews.forEach { showsStackView.addArrangedSubview($0) }
    }
    
    func update(with movies: [Movie]) {
        moviesStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        let cardViews: [UIView] = movies.map { movie in
            let cardView = CardView.instantiate()
            cardPresenter.present(movie: movie, in: cardView)
            cardView.tapGestureRecognizer.rx.event
                .subscribe(onNext: { [weak self] _ in
                    self?.presenter.didSelect(movie: movie)
                })
                .disposed(by: disposeBag)
            
            return cardView
        }
        
        cardViews.forEach { moviesStackView.addArrangedSubview($0) }
    }
}
