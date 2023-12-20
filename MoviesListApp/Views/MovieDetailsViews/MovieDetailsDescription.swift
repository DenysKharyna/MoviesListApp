//
//  MovieDetailsDescription.swift
//  MoviesListApp
//
//  Created by Денис Харына on 20.12.2023.
//

import UIKit

final class MovieDetailsDescription: UIView {
    // MARK: Properties
    private let descriptionTitle = UILabel()
    let descriptionText = UILabel()
    
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
        descriptionTitle.titleTextStyle(text: "Short description", fontSize: 20)
        descriptionText.simpleTextStyle(fontSize: 14)
    }
    private func constrain() {
        let mainStack = UIStackView(arrangedSubviews: [descriptionTitle, descriptionText])
        mainStack.axis = .vertical
        mainStack.spacing = 10
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            mainStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
