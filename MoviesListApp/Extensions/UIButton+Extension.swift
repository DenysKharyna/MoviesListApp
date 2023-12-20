//
//  UIButton+Extension.swift
//  MoviesListApp
//
//  Created by Денис Харына on 20.12.2023.
//

import UIKit

extension UIButton {
    func appDefaultStyle(title: String = "", bgColor: UIColor, titleColor: UIColor, borderColor: UIColor = UIColor.clear, borderWidth: CGFloat = 0) {
        setTitle(title, for: .normal)
        layer.cornerRadius = 18
        backgroundColor = bgColor
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 11)
        heightAnchor.constraint(equalToConstant: 36).isActive = true
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
    }
}
