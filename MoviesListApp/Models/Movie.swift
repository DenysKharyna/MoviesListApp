//
//  Movie.swift
//  MoviesListApp
//
//  Created by Денис Харына on 19.12.2023.
//

import UIKit

struct Movie {
    let coverImage: UIImage
    let title: String
    let description: String
    let rating: Float
    let duration: DateComponents
    let genre: [Genre]
    let releasedDate: Date?
    let trailerLinkURL: URL
    let isInWatchList: Bool = false
    
    init(coverImage: UIImage, title: String, description: String, rating: Float, duration: DateComponents, genre: [Genre], releasedDate: String, trailerLinkURL: URL) {
        self.coverImage = coverImage
        self.title = title
        self.description = description
        self.rating = rating
        self.duration = duration
        self.genre = genre
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        dateFormatter.timeZone = TimeZone(identifier: "GMT")
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        self.releasedDate = dateFormatter.date(from: releasedDate)
        self.trailerLinkURL = trailerLinkURL
    }
}

