//
//  MoviesManager.swift
//  MoviesListApp
//
//  Created by Денис Харына on 19.12.2023.
//

import Foundation

final class MoviesManager {
    // MARK: Properties
    static let shared = MoviesManager()
    private(set) var moviesList: [Movie] = []
    
    // MARK: Life cycle
    private init() {
        self.moviesList = configureMovies()
    }
    
    // MARK: Sorting Methods
    func sortMoviesByTitle() {
        moviesList.sort { $0.title < $1.title }
    }
    
    func sortMoviesByDate() {
        let withoutDate = moviesList.filter({ $0.releasedDate == nil })
        moviesList = moviesList
            .filter({ $0.releasedDate != nil })
            .sorted(by: { $0.releasedDate! > $1.releasedDate! })
        
        moviesList.append(contentsOf: withoutDate)
    }
    
    func addToWatchList(movie: Movie) {
        if let index = moviesList.firstIndex(where: { $0.title == movie.title }) {
            moviesList[index].addToWatchlist()
        }
    }
    
    func removeFromWatchList(movie: Movie) {
        if let index = moviesList.firstIndex(where: { $0.title == movie.title }) {
            moviesList[index].removeFromWatchlist()
        }
    }
}

// MARK: - Configuring Movies
extension MoviesManager {
    private func configureMovies() -> [Movie] {
        [
            Movie(coverImage: .tenet,
                  title: "Tenet",
                  description: "Armed with only one word, Tenet, and fighting for the survival of the entire world, a Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.",
                  rating: 7.8,
                  duration: DateComponents(hour: 2, minute: 30),
                  genre: [.action, .sciFi],
                  releasedDate: "3 September 2020",
                  trailerLinkURL: URL(string: "https://www.youtube.com/watch?v=LdOM0x0XDMo")!),
            
            Movie(coverImage: .spiderMan,
                  title: "Spider-Man: Into the Spider-Verse",
                  description: "Teen Miles Morales becomes the Spider-Man of his universe, and must join with five spider-powered individuals from other dimensions to stop a threat for all realities.",
                  rating: 8.4,
                  duration: DateComponents(hour: 1, minute: 57),
                  genre: [.action, .animation, .adventure],
                  releasedDate: "14 December 2018",
                  trailerLinkURL: URL(string: "https://www.youtube.com/watch?v=tg52up16eq0")!),
            
            Movie(coverImage: .knivesOut,
                  title: "Knives Out",
                  description: "A detective investigates the death of a patriarch of an eccentric, combative family.",
                  rating: 7.9,
                  duration: DateComponents(hour: 2, minute: 10),
                  genre: [.comedy, .crime, .drama],
                  releasedDate: "27 November 2019",
                  trailerLinkURL: URL(string: "https://www.youtube.com/watch?v=qGqiHJTsRkQ")!),
            
            Movie(coverImage: .galaxyGuardians,
                  title: "Guardians of the Galaxy",
                  description: "A group of intergalactic criminals must pull together to stop a fanatical warrior with plans to purge the universe.",
                  rating: 8.0,
                  duration: DateComponents(hour: 2, minute: 1),
                  genre: [.action, .adventure, .comedy],
                  releasedDate: "1 August 2014",
                  trailerLinkURL: URL(string: "https://www.youtube.com/watch?v=d96cjJhvlMA")!),
            
            Movie(coverImage: .avengers,
                  title: "Avengers: Age of Ultron",
                  description: "When Tony Stark and Bruce Banner try to jump-start a dormant peacekeeping program called Ultron, things go horribly wrong and it's up to Earth's mightiest heroes to stop the villainous Ultron from enacting his terrible plan.",
                  rating: 7.3,
                  duration: DateComponents(hour: 2, minute: 21),
                  genre: [.sciFi, .action, .adventure],
                  releasedDate: "1 May 2015",
                  trailerLinkURL: URL(string: "https://www.youtube.com/watch?v=tg52up16eq0")!),
        ]
    }
}
