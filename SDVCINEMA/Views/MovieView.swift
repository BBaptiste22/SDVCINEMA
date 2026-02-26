import SwiftUI
import SwiftData

struct MovieView: View {

    @StateObject var viewModel = MovieViewModel()
    @Environment(\.modelContext) private var context
    @Query var favorites: [Favorite]

    @State private var searchText = ""

    var filteredMovies: [Movie] {
        if searchText.isEmpty {
            return viewModel.movies
        } else {
            return viewModel.movies.filter {
                $0.detailTitle.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    func isFavorite(_ movie: Movie) -> Bool {
        favorites.contains { $0.id == movie.id && $0.isMovie }
    }

    func toggleFavorite(_ movie: Movie) {
        if let existing = favorites.first(where: { $0.id == movie.id && $0.isMovie }) {
            context.delete(existing)
        } else {
            let fav = Favorite(
                id: movie.id,
                title: movie.detailTitle,
                overview: movie.detailOverview,
                posterPath: movie.detailPosterPath,
                date: movie.detailDate,
                isMovie: true
            )
            context.insert(fav)
        }
        try? context.save()
    }

    var body: some View {
        NavigationStack {
            List(filteredMovies) { movie in
                NavigationLink {
                    DetailView(media: movie)
                } label: {
                    HStack(spacing: 16) {
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")) { image in
                            image.resizable().scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 80, height: 120)
                        .cornerRadius(8)

                        VStack(alignment: .leading) {
                            Text(movie.detailTitle).font(.headline)
                            Text(movie.detailDate).font(.subheadline).foregroundColor(.gray)
                        }

                        Spacer()
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Films Populaires")
            .searchable(text: $searchText, prompt: "Rechercher un film")
        }
        .onAppear {
            viewModel.fetchMovies()
        }
    }
}
