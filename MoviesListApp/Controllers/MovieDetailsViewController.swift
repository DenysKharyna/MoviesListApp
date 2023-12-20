//
//  MovieDetailsViewController.swift
//  MoviesListApp
//
//  Created by Денис Харына on 20.12.2023.
//

import UIKit

final class MovieDetailsViewController: UIViewController {
    // MARK: Properties
    var movie: Movie? {
        didSet {
            guard let movie = movie else { return }
        }
    }
    
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: Helpers
    private func configureUI() {
        self.navigationController?.navigationBar.tintColor = .label
        view.backgroundColor = .systemBackground
    }
}
