import Foundation

struct PopularMovieResponse: Codable {
    let results: [Movie]
}

struct PopularSerieResponse: Codable {
    let results: [Serie]
}
