//
//  MainViewController.swift
//  MoviesListApp
//
//  Created by Денис Харына on 19.12.2023.
//

import UIKit

final class MainViewController: UITableViewController {
    // MARK: Properties
    private let cellID = "mainVCCell"
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Movies"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: Helper
    private func configureUI() {
        tableView.register(MainVCTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.showsVerticalScrollIndicator = false
        
        self.navigationItem.setRightBarButton(UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(showSortMenu)), animated: true)
        self.navigationItem.rightBarButtonItem?.tintColor = .label
    }
    
    // MARK: Selectors
    @objc private func showSortMenu() {
        let alert = SortingAlert(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.delegate = self
        self.present(alert, animated: true)
    }
}

// MARK: - UITableViewDatasource
extension MainViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        MoviesManager.shared.moviesList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MainVCTableViewCell
        cell.movie = MoviesManager.shared.moviesList[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MainViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        210
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.title = ""
        self.navigationItem.backButtonTitle = "Movies"
        let vc = MovieDetailsViewController()
        vc.movieDetailsView.movie = MoviesManager.shared.moviesList[indexPath.row]
        vc.movieDetailsView.mainInfoView.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - SortingAlertDelegate
extension MainViewController: SortingAlertDelegate {
    func reloadTableView() {
        tableView.reloadData()
    }
}
