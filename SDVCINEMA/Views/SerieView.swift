import SwiftUI
import SwiftData

struct SerieView: View {

    @StateObject var viewModel = SerieViewModel()
    @Environment(\.modelContext) private var context
    @Query var favorites: [Favorite]

    @State private var searchText = ""

    var filteredSeries: [Serie] {
        if searchText.isEmpty {
            return viewModel.series
        } else {
            return viewModel.series.filter {
                $0.detailTitle.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    func isFavorite(_ serie: Serie) -> Bool {
        favorites.contains { $0.id == serie.id && !$0.isMovie }
    }

    func toggleFavorite(_ serie: Serie) {
        if let existing = favorites.first(where: { $0.id == serie.id && !$0.isMovie }) {
            context.delete(existing)
        } else {
            let fav = Favorite(
                id: serie.id,
                title: serie.detailTitle,
                overview: serie.detailOverview,
                posterPath: serie.detailPosterPath,
                date: serie.detailDate,
                isMovie: false
            )
            context.insert(fav)
        }
        try? context.save()
    }

    var body: some View {
        NavigationStack {
            List(filteredSeries) { serie in
                NavigationLink {
                    DetailView(media: serie)
                } label: {
                    HStack {
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(serie.posterPath)")) { image in
                            image.resizable().scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 80, height: 120)
                        .cornerRadius(8)

                        VStack(alignment: .leading) {
                            Text(serie.detailTitle)
                            Text(serie.detailDate)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }

                        Spacer()
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Séries Populaires")
            .searchable(text: $searchText, prompt: "Rechercher une série")
        }
        .onAppear {
            viewModel.fetchSeries()
        }
    }
}
