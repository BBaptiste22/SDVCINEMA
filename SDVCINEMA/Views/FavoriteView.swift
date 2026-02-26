import SwiftUI
import SwiftData

struct FavoritesView: View {
    
    @Environment(\.modelContext) private var context
    @Query(sort: \Favorite.title) private var favorites: [Favorite]
    
    var body: some View {
        NavigationStack {
            
            if favorites.isEmpty {
                
                VStack(spacing: 20) {
                    Image(systemName: "star")
                        .font(.system(size: 50))
                        .foregroundColor(.gray)
                    
                    Text("Aucun favori")
                        .font(.title3)
                        .foregroundColor(.gray)
                    
                    Text("Ajoute un film ou une série depuis la page détail ⭐")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray.opacity(0.7))
                        .padding(.horizontal)
                }
                .navigationTitle("Favoris")
                
            } else {
                
                List {
                    ForEach(favorites) { item in
                        
                        NavigationLink {
                            DetailView(media: item)
                        } label: {
                            
                            HStack(spacing: 16) {
                                
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(item.posterPath)")) { image in
                                    image.resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 70, height: 100)
                                .cornerRadius(8)
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    
                                    Text(item.title)
                                        .font(.headline)
                                    
                                    Text(item.date)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    
                                    Text(item.isMovie ? "Film" : "Série")
                                        .font(.caption)
                                        .foregroundColor(.blue)
                                }
                                
                                Spacer()
                            }
                            .padding(.vertical, 6)
                        }
                    }
                    .onDelete(perform: deleteFavorite)
                }
                .navigationTitle("Favoris")
            }
        }
    }
    
    private func deleteFavorite(at offsets: IndexSet) {
        for index in offsets {
            context.delete(favorites[index])
        }
        try? context.save()
    }
}
