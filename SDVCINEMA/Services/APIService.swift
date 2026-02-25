//
//  APIService.swift
//
//
//  Created by Etudiants on 25/02/2026.
//

import Foundation

class ApiService {
    
    private let apiKey = "c815eae7cd3b988cc093bade57204182"
    
    private var popularMoviesURL: String {
        return "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1&api_key=\(apiKey)"
    }
    
    private var popularSeriesURL: String {
        return "https://api.themoviedb.org/3/tv/popular?language=en-US&page=1&api_key=\(apiKey)"
    }
    
    
    func fetchPopularMovies(completion: @escaping ([Movie]?) -> Void) {
        
        guard let url = URL(string: popularMoviesURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                print("Erreur :", error)
                completion(nil)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decoded = try JSONDecoder().decode(PopularMovieResponse.self, from: data)
                completion(decoded.results)
            } catch {
                print("Erreur décodage :", error)
                completion(nil)
            }
            
        }.resume()
    }
    
    
    
    func fetchPopularSeries(completion: @escaping ([Serie]?) -> Void) {
        
        guard let url = URL(string: popularSeriesURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                print("Erreur :", error)
                completion(nil)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decoded = try JSONDecoder().decode(PopularSerieResponse.self, from: data)
                completion(decoded.results)
            } catch {
                print("Erreur décodage :", error)
                completion(nil)
            }
            
        }.resume()
    }
}
