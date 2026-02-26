//
//  Favorite.swift
//  SDVCINEMA
//
//  Created by Etudiants on 25/02/2026.
//

import Foundation
import SwiftData

@Model
class FavoriteItem {
    
    var id: Int
    var title: String
    var posterPath: String
    var date: String
    var overview: String
    
    init(id: Int, title: String, posterPath: String, date: String, overview: String) {
        self.id = id
        self.title = title
        self.posterPath = posterPath
        self.date = date
        self.overview = overview
    }
}
