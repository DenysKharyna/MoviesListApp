//
//  MovieDetailsView.swift
//  MoviesListApp
//
//  Created by Денис Харына on 21.12.2023.
//

import UIKit

final class MovieDetailsView: UIView {
    // MARK: Properties
    let mainInfoView = MovieDetailsMainInfoView()
    private let firstSeparator = SeparatorView()
    private let descriptionView = MovieDetailsDescription()
    private let secondSeparator = SeparatorView()
    private let extraInfoView = MovieDetailsExtraInfoView()
    
    var movie: Movie? {
        didSet {
            guard let movie = movie else { return }
            mainInfoView.movie = movie
            mainInfoView.coverImage.imageView.image = movie.coverImage
            mainInfoView.titleLabel.text = movie.title
            mainInfoView.ratingLabel.text = String(movie.rating)
            mainInfoView.watchlistButton.setTitle(movie.isInWatchList ? "REMOVE FROM WATCHLIST" : "+ ADD TO WATCHLIST", for: .normal)
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
    override init(frame: CGRect) {
        super.init(frame: frame)
        constrain()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func constrain() {
        mainInfoView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        extraInfoView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainInfoView)
        addSubview(firstSeparator)
        addSubview(descriptionView)
        addSubview(secondSeparator)
        addSubview(extraInfoView)
        
        NSLayoutConstraint.activate([
            mainInfoView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainInfoView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            mainInfoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mainInfoView.heightAnchor.constraint(equalToConstant: 240),
            
            firstSeparator.topAnchor.constraint(equalTo: mainInfoView.bottomAnchor),
            firstSeparator.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionView.topAnchor.constraint(equalTo: firstSeparator.bottomAnchor, constant: 25),
            descriptionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            descriptionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            secondSeparator.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 25),
            secondSeparator.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            extraInfoView.topAnchor.constraint(equalTo: secondSeparator.bottomAnchor, constant: 25),
            extraInfoView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            extraInfoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        ])
    }
}
