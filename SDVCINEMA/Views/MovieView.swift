import SwiftUI

struct MovieView: View {
    
    @StateObject var viewModel = MovieViewModel()
    @State private var searchText = ""
    
    var filteredMovies: [Movie] {
        if searchText.isEmpty {
            return viewModel.movies
        } else {
            return viewModel.movies.filter {
                $0.searchableTitle.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            
            List(filteredMovies) { movie in
                
                NavigationLink(destination:
                    DetailView(
                        id: movie.id,
                        title: movie.title,
                        posterPath: movie.posterPath,
                        date: movie.releaseDate,
                        overview: movie.overview
                    )
                ) {
                    HStack(spacing: 16) {
                        
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 90, height: 130)
                        .cornerRadius(12)
                        .shadow(radius: 8)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text(movie.title)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Text(movie.releaseDate)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .background(
                        Color(.systemGray6)
                            .opacity(0.1)
                            .cornerRadius(16)
                    )
                }
            }
            .listRowBackground(Color.black)
            .scrollContentBackground(.hidden)
            .background(Color.black)
            .navigationTitle("Films")
            .searchable(text: $searchText, prompt: "Rechercher un film")
        }
        .onAppear {
            viewModel.fetchMovies()
        }
    }
}
