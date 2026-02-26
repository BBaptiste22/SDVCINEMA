import SwiftData

@Model
class Favorite: Identifiable {
    
    var id: Int
    var title: String
    var overview: String
    var posterPath: String
    var date: String
    var isMovie: Bool
    
    init(id: Int, title: String, overview: String, posterPath: String, date: String, isMovie: Bool) {
        self.id = id
        self.title = title
        self.overview = overview
        self.posterPath = posterPath
        self.date = date
        self.isMovie = isMovie
    }
}

extension Favorite: DetailPresentable {
    var detailTitle: String { title }
    var detailOverview: String { overview }
    var detailPosterPath: String { posterPath }
    var detailDate: String { date }
}
