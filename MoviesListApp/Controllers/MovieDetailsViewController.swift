//
//  MovieDetailsViewController.swift
//  MoviesListApp
//
//  Created by Денис Харына on 20.12.2023.
//

import UIKit

final class MovieDetailsViewController: UIViewController {
    // MARK: Properties
    private let mainInfoView = MovieDetailsMainInfoView()
    
    var movie: Movie? {
        didSet {
            guard let movie = movie else { return }
            mainInfoView.coverImage.imageView.image = movie.coverImage
            mainInfoView.titleLabel.text = movie.title
            mainInfoView.ratingLabel.text = String(movie.rating)
            mainInfoView.addToWatchlistButton.setTitle(movie.isInWatchList ? "REMOVE FROM WATCHLIST" : "+ ADD TO WATCHLIST", for: .normal)
        }
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        constrain()
    }
    
    // MARK: Helpers
    private func configureUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.tintColor = .label
        view.backgroundColor = .systemBackground
        
    }
    
    private func constrain() {
        mainInfoView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainInfoView)
        
        NSLayoutConstraint.activate([
            mainInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainInfoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainInfoView.heightAnchor.constraint(equalToConstant: 230),
        ])
    }
}
