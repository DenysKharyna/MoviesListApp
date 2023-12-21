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
    var isInWatchList: Bool
    
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
        self.isInWatchList = UserDefaults.standard.bool(forKey: title)
    }
    
    func getDuration() -> String {
        guard let hours = duration.hour, let minutes = duration.minute else { return "" }
        return "\(hours)h \(minutes)min"
    }
    
    func getGenres() -> String {
        genre.map({ $0.rawValue }).joined(separator: ", ")
    }
    
    mutating func addToWatchlist() {
        isInWatchList = true
        UserDefaults.standard.setValue(true, forKey: title)
    }
    
    mutating func removeFromWatchlist() {
        isInWatchList = false
        UserDefaults.standard.setValue(false, forKey: title)
    }
}

