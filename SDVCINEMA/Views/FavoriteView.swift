import SwiftUI
import SwiftData

struct FavoritesView: View {
    
    @Environment(\.modelContext) private var context
    @Query var favorites: [FavoriteItem]
    
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(favorites) { item in
                    
                    HStack(spacing: 16) {
                        
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(item.posterPath)")) { image in
                            image.resizable().scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 60, height: 90)
                        .cornerRadius(8)
                        
                        Text(item.title)
                    }
                }
                .onDelete(perform: deleteFavorite)
            }
            .navigationTitle("Favoris")
        }
    }
    
    private func deleteFavorite(at offsets: IndexSet) {
        for index in offsets {
            let fav = favorites[index]
            context.delete(fav)
        }
    }
}
