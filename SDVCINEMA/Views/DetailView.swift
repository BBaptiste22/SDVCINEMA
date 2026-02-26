import SwiftUI
import SwiftData

struct DetailView: View {
    
    let id: Int
    let title: String
    let posterPath: String
    let date: String
    let overview: String
    
    @Environment(\.modelContext) private var context
    @Query private var favorites: [FavoriteItem]
    
    var isFavorite: Bool {
        favorites.contains(where: { $0.id == id })
    }
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 16) {
                
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                
                Text(title)
                    .font(.title)
                    .bold()
                
                Text("Date : \(date)")
                    .foregroundColor(.gray)
                
                Text(overview)
            }
            .padding()
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button(action: toggleFavorite) {
                Image(systemName: isFavorite ? "star.fill" : "star")
                    .foregroundColor(.yellow)
            }
        }
    }
    
    private func toggleFavorite() {
        if let existing = favorites.first(where: { $0.id == id }) {
            context.delete(existing)
        } else {
            let newFavorite = FavoriteItem(
                id: id,
                title: title,
                posterPath: posterPath,
                date: date,
                overview: overview
            )
            context.insert(newFavorite)
        }
    }
}
