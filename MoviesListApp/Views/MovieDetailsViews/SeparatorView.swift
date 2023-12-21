//
//  SeparatorView.swift
//  MoviesListApp
//
//  Created by Денис Харына on 20.12.2023.
//

import UIKit

final class SeparatorView: UIView {
    // MARK: Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Helpers
    private func configureView() {
        backgroundColor = .systemGray5
        widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30).isActive = true
        heightAnchor.constraint(equalToConstant: 1).isActive = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
