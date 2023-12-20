//
//  MovieCoverImage.swift
//  MoviesListApp
//
//  Created by Денис Харына on 20.12.2023.
//

import UIKit

final class MovieCoverImage: UIView {
    
    var imageView = UIImageView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureView()
    }
    
    private func configureView() {
        clipsToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.5, height: 3)
        layer.shadowOpacity = 0.6
        layer.shadowRadius = 3
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 8).cgPath
        
        imageView.frame = bounds
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        
        addSubview(imageView)
    }
}
