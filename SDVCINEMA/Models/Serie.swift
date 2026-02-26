//
//  Serie.swift
//
//
//  Created by Etudiants on 25/02/2026.
//


import Foundation

class Serie: Codable, Identifiable ,Searchable {
    
    
    let id: Int
    let name: String
    let overview: String
    let posterPath: String
    let firstAirDate: String
    
    var searchableTitle: String {
           name
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case overview
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
    }
}
