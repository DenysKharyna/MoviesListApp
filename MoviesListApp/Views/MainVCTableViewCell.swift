//
//  MainViewControllerTableViewCell.swift
//  MoviesListApp
//
//  Created by Денис Харына on 19.12.2023.
//

import UIKit

final class MainVCTableViewCell: UITableViewCell {
    // MARK: Properties
    private let movieCoverImage = MovieCoverImage()
    private let movieTitleLabel = UILabel()
    private let mainInfoLabel = UILabel()
    private let onWatchListLabel = UILabel()
    
    var movie: Movie? {
        didSet {
            guard let movie = movie else { return }
            movieCoverImage.imageView.image = movie.coverImage
            movieTitleLabel.text = "\(movie.title)"
            if let date = movie.releasedDate {
                movieTitleLabel.text! += " (\(date.description.prefix(4)))"
            }
            mainInfoLabel.text = "\(movie.getDuration()) - \(movie.getGenres())"
            mainInfoLabel.setLineSpacing(2)
            onWatchListLabel.isHidden = !movie.isInWatchList
        }
    }
    
    // MARK: Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        constrain()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Helpers
    private func configureUI() {
        // movieCoverImage
        movieCoverImage.widthAnchor.constraint(equalToConstant: 110).isActive = true
        movieCoverImage.heightAnchor.constraint(equalToConstant: 170).isActive = true
        // movieTitleLabel
        movieTitleLabel.titleTextStyle(fontSize: 20)
        // mainInfoLabel
        mainInfoLabel.simpleTextStyle(fontSize: 14)
        // onWatchListLabel
        onWatchListLabel.font = .systemFont(ofSize: 11, weight: .bold)
        onWatchListLabel.textColor = .secondaryLabel
        onWatchListLabel.text = "ON MY WATCHLIST"
    }
    
    private func constrain() {
        // infoStack
        let infoStack = UIStackView(arrangedSubviews: [movieTitleLabel, mainInfoLabel])
        infoStack.axis = .vertical
        infoStack.spacing = 5
        // allTextStack
        let allTextStack = UIStackView(arrangedSubviews: [infoStack, onWatchListLabel])
        allTextStack.axis = .vertical
        allTextStack.spacing = 30
        // MainStack
        let mainStack = UIStackView(arrangedSubviews: [movieCoverImage, allTextStack])
        mainStack.axis = .horizontal
        mainStack.spacing = 20
        mainStack.alignment = .center
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(mainStack)
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            mainStack.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
}
