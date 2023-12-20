//
//  SortingAlert.swift
//  MoviesListApp
//
//  Created by Денис Харына on 20.12.2023.
//

import UIKit

protocol SortingAlertDelegate: AnyObject {
    func reloadTableView()
}

final class SortingAlert: UIAlertController {
    // MARK: Properties
    weak var delegate: SortingAlertDelegate?
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAlert()
    }
    // MARK: Helper
    private func configureAlert() {
        view.tintColor = .label
        addAction(UIAlertAction(title: "Title", style: .default, handler: { _ in
            MoviesManager.shared.sortMoviesByTitle()
            self.delegate?.reloadTableView()
        }))
        addAction(UIAlertAction(title: "Released Date", style: .default, handler: { _ in
            MoviesManager.shared.sortMoviesByDate()
            self.delegate?.reloadTableView()
        }))
        addAction(UIAlertAction(title: "Cancel", style: .cancel))
    }
}
