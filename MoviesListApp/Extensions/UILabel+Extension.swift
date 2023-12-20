//
//  UILabel+Extension.swift
//  MoviesListApp
//
//  Created by Денис Харына on 20.12.2023.
//

import UIKit

extension UILabel {
    func simpleTextStyle(fontSize: CGFloat) {
        font = .systemFont(ofSize: fontSize)
        lineBreakStrategy = .hangulWordPriority
        textColor = .secondaryLabel
        numberOfLines = 0
    }
    func titleTextStyle() {
        font = .systemFont(ofSize: 22, weight: .bold)
        textColor = .label
        numberOfLines = 0
        lineBreakStrategy = .hangulWordPriority
    }
}
