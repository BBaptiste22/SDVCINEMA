//
//  Movie.swift
//
//
//  Created by Etudiants on 25/02/2026.
//

import Foundation

class Movie: Codable, Identifiable, DetailPresentable {
    
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
    
    var detailTitle: String { title }
    var detailOverview: String { overview }
    var detailPosterPath: String { posterPath }
    var detailDate: String { releaseDate }
}
