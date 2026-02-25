import SwiftUI

struct MovieView: View {
    
    @StateObject var viewModel = MovieViewModel()
    
    var body: some View {
        NavigationView {
            
            List(viewModel.movies, id: \.id) { movie in
                
                NavigationLink(destination:
                    DetailView(
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
                        .frame(width: 80, height: 120)
                        .cornerRadius(8)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            
                            Text(movie.title)
                                .font(.headline)
                            
                            Text(movie.releaseDate)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Films Populaires")
        }
        .onAppear {
            viewModel.fetchMovies()
        }
    }
}
