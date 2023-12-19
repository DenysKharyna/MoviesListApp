//
//  MainViewControllerTableViewCell.swift
//  MoviesListApp
//
//  Created by Денис Харына on 19.12.2023.
//

import UIKit

final class MainVCTableViewCell: UITableViewCell {
    // MARK: Properties
    private let movieCoverImage = UIImageView()
    private let movieTitleLabel = UILabel()
    private let mainInfoLabel = UILabel()
    private let onWatchListLabel = UILabel()
    
    var movie: Movie? {
        didSet {
            guard let movie = movie else { return }
            movieCoverImage.image = movie.coverImage
            movieTitleLabel.text = "\(movie.title)"
            if let date = movie.releasedDate {
                movieTitleLabel.text! += " (\(date.description.prefix(4)))"
            }
            mainInfoLabel.text = "\(movie.getDuration()) - \(movie.getGenres())"
            onWatchListLabel.isHidden = movie.isInWatchList
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
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    // MARK: Helpers
    private func configureUI() {
        // movieCoverImage
        movieCoverImage.layer.masksToBounds = true
        movieCoverImage.layer.cornerRadius = 8
        movieCoverImage.layer.shadowColor = UIColor.black.cgColor
        movieCoverImage.layer.shadowOpacity = 0.6
        movieCoverImage.layer.shadowOffset = CGSize(width: 0, height: 5)
        movieCoverImage.layer.shadowRadius = 5
        movieCoverImage.widthAnchor.constraint(equalToConstant: 110).isActive = true
        movieCoverImage.heightAnchor.constraint(equalToConstant: 170).isActive = true
        // movieTitleLabel
        movieTitleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        movieTitleLabel.textColor = .label
        movieTitleLabel.numberOfLines = 0
        // mainInfoLabel
        mainInfoLabel.font = .systemFont(ofSize: 14)
        mainInfoLabel.lineBreakStrategy = .hangulWordPriority
        mainInfoLabel.textColor = .secondaryLabel
        mainInfoLabel.numberOfLines = 0
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
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            mainStack.heightAnchor.constraint(equalToConstant: 180),
        ])
    }
    

}
