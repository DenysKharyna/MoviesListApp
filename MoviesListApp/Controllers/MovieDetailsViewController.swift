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
    private let firstSeparator = SeparatorView()
    private let descriptionView = MovieDetailsDescription()
    private let secondSeparator = SeparatorView()
    private let extraInfoView = MovieDetailsExtraInfoView()
    
    var movie: Movie? {
        didSet {
            guard let movie = movie else { return }
            mainInfoView.coverImage.imageView.image = movie.coverImage
            mainInfoView.titleLabel.text = movie.title
            mainInfoView.ratingLabel.text = String(movie.rating)
            mainInfoView.addToWatchlistButton.setTitle(movie.isInWatchList ? "REMOVE FROM WATCHLIST" : "+ ADD TO WATCHLIST", for: .normal)
            descriptionView.descriptionText.text = movie.description
            descriptionView.descriptionText.setLineSpacing(2)
            extraInfoView.genreLabel.text = movie.getGenres()
            guard let date = movie.releasedDate else { return }
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy, d MMMM"
            extraInfoView.releasedDateLabel.text = formatter.string(from: date)
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
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        extraInfoView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainInfoView)
        view.addSubview(firstSeparator)
        view.addSubview(descriptionView)
        view.addSubview(secondSeparator)
        view.addSubview(extraInfoView)
        
        NSLayoutConstraint.activate([
            mainInfoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainInfoView.heightAnchor.constraint(equalToConstant: 240),
            
            firstSeparator.topAnchor.constraint(equalTo: mainInfoView.bottomAnchor),
            firstSeparator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            descriptionView.topAnchor.constraint(equalTo: firstSeparator.bottomAnchor, constant: 25),
            descriptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            descriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            secondSeparator.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 25),
            secondSeparator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            extraInfoView.topAnchor.constraint(equalTo: secondSeparator.bottomAnchor, constant: 25),
            extraInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            extraInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
    }
}
