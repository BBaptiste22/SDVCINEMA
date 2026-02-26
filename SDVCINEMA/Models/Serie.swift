import Foundation

class Serie: Codable, Identifiable, DetailPresentable {
    
    let id: Int
    let name: String
    let overview: String
    let posterPath: String
    let firstAirDate: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case overview
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
    }
    
    var detailTitle: String { name }
    var detailOverview: String { overview }
    var detailPosterPath: String { posterPath }
    var detailDate: String { firstAirDate }
}
