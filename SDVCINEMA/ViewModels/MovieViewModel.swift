//
//  MovieViewModel 2.swift
//  SDVCINEMA
//
//  Created by Etudiant on 25/02/2026.
//

import Foundation
import Combine

class MovieViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    
    private let apiService = ApiService()
    
    func fetchMovies() {
        apiService.fetchPopularMovies { movies in
            DispatchQueue.main.async {
                self.movies = movies ?? []
            }
        }
    }
}
