//
//  MovieDetailsExtraInfoView.swift
//  MoviesListApp
//
//  Created by Денис Харына on 20.12.2023.
//

import UIKit

final class MovieDetailsExtraInfoView: UIView {
    // MARK: Properties
    private let detailsTitle = UILabel()
    private let genreTitle = UILabel()
    let genreLabel = UILabel()
    private let releasedDateTitle = UILabel()
    let releasedDateLabel = UILabel()
    
    // MARK: Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        constrain()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Helpers
    private func configureUI() {
        // detailsTitle
        detailsTitle.titleTextStyle(text: "Details", fontSize: 20)
        detailsTitle.translatesAutoresizingMaskIntoConstraints = false
        // genreTitle
        genreTitle.titleTextStyle(text: "Genre", fontSize: 14)
        genreTitle.widthAnchor.constraint(equalToConstant: 100).isActive = true
        genreTitle.textAlignment = .right
        // releasedDateTitle
        releasedDateTitle.titleTextStyle(text: "Released date", fontSize: 14)
        releasedDateTitle.widthAnchor.constraint(equalToConstant: 100).isActive = true
        releasedDateTitle.textAlignment = .right
        // Labels
        genreLabel.simpleTextStyle(fontSize: 14)
        releasedDateLabel.simpleTextStyle(fontSize: 14)
    }
    
    private func constrain() {
        let genreStack = UIStackView(arrangedSubviews: [genreTitle, genreLabel])
        genreStack.axis = .horizontal
        genreStack.spacing = 15
        genreStack.alignment = .top
        
        let dateStack = UIStackView(arrangedSubviews: [releasedDateTitle, releasedDateLabel])
        dateStack.axis = .horizontal
        dateStack.spacing = 15
        dateStack.alignment = .top
        
        let mainStack = UIStackView(arrangedSubviews: [genreStack, dateStack])
        mainStack.axis = .vertical
        mainStack.spacing = 7
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(detailsTitle)
        addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            detailsTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            detailsTitle.topAnchor.constraint(equalTo: topAnchor),
            
            mainStack.topAnchor.constraint(equalTo: detailsTitle.bottomAnchor, constant: 10),
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            mainStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
