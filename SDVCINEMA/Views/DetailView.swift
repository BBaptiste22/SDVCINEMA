import SwiftUI
import SwiftData

struct DetailView: View {
    
    let media: DetailPresentable
    
    @Environment(\.modelContext) private var context
    @Query var favorites: [Favorite]
    
    var isFavorite: Bool {
        favorites.contains { $0.id == media.id }
    }
    
    func toggleFavorite() {
        if let existing = favorites.first(where: { $0.id == media.id }) {
            context.delete(existing)
        } else {
            let newFavorite = Favorite(
                id: media.id,
                title: media.detailTitle,
                overview: media.detailOverview,
                posterPath: media.detailPosterPath,
                date: media.detailDate,
                isMovie: media is Movie
            )
            context.insert(newFavorite)
        }
        
        try? context.save()
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(media.detailPosterPath)")) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .cornerRadius(12)
                
                Text(media.detailTitle)
                    .font(.title)
                    .bold()
                
                Text(media.detailDate)
                    .foregroundColor(.gray)
                
                Text(media.detailOverview)
                    .padding()
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle(media.detailTitle)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    toggleFavorite()
                } label: {
                    Image(systemName: isFavorite ? "star.fill" : "star")
                        .foregroundColor(.yellow)
                }
            }
        }
    }
}
