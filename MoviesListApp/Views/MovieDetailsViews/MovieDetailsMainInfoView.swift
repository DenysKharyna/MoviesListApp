//
//  MovieDetailsMainInfoView.swift
//  MoviesListApp
//
//  Created by Денис Харына on 20.12.2023.
//

import UIKit

final class MovieDetailsMainInfoView: UIView {
    // MARK: Properties
    let coverImage = MovieCoverImage()
    let titleLabel = UILabel()
    let ratingLabel = UILabel()
    private let maxRating = UILabel()
    let addToWatchlistButton = UIButton()
    let watchTrailerButton = UIButton()

    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        constrain()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Helpers
    private func configureUI() {
        // coverImage
        coverImage.widthAnchor.constraint(equalToConstant: 130).isActive = true
        coverImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        // titleLabel
        titleLabel.titleTextStyle()
        titleLabel.adjustsFontSizeToFitWidth = true
        // ratingLabel
        ratingLabel.font = .systemFont(ofSize: 22, weight: .bold)
        ratingLabel.textColor = .label
        // maxRating
        maxRating.text = "/10"
        maxRating.simpleTextStyle(fontSize: 16)
        // addToWatchlistButton
        addToWatchlistButton.appDefaultStyle(bgColor: .systemGray5, titleColor: .secondaryLabel)
        addToWatchlistButton.widthAnchor.constraint(equalTo: addToWatchlistButton.titleLabel!.widthAnchor, constant: 24).isActive = true
        addToWatchlistButton.addTarget(self, action: #selector(addToWatchListTapped), for: .touchUpInside)
        // watchTrailerButton
        watchTrailerButton.appDefaultStyle(title: "WATCH TRAILER", bgColor: .clear, titleColor: .label, borderColor: UIColor.label, borderWidth: 1)
        watchTrailerButton.widthAnchor.constraint(equalTo: watchTrailerButton.titleLabel!.widthAnchor, constant: 54).isActive = true
        watchTrailerButton.addTarget(self, action: #selector(watchTrailerTapped), for: .touchUpInside)
    }
    private func constrain() {
        let ratingStack = UIStackView(arrangedSubviews: [ratingLabel, maxRating])
        ratingStack.axis = .horizontal
        ratingStack.spacing = 0
        
        let titleRatingStack = UIStackView(arrangedSubviews: [titleLabel, ratingStack])
        titleRatingStack.axis = .horizontal
        titleRatingStack.distribution = .equalSpacing
        titleRatingStack.alignment = .top
        
        let buttonsStack = UIStackView(arrangedSubviews: [addToWatchlistButton, watchTrailerButton])
        buttonsStack.axis = .vertical
        buttonsStack.spacing = 20
        buttonsStack.alignment = .leading
        
        let mainInfoStack = UIStackView(arrangedSubviews: [titleRatingStack, buttonsStack])
        mainInfoStack.axis = .vertical
        mainInfoStack.spacing = 35
        mainInfoStack.isLayoutMarginsRelativeArrangement = true
        mainInfoStack.layoutMargins = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
        let mainStack = UIStackView(arrangedSubviews: [coverImage, mainInfoStack])
        mainStack.axis = .horizontal
        mainStack.alignment = .top
        mainStack.spacing = 20
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            mainStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            mainStack.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    // MARK: Selectors
    @objc private func addToWatchListTapped() {
        print("addToWatchListTapped")
    }
    @objc private func watchTrailerTapped() {
        print("watchTrailerTapped")
    }
}
