import SwiftUI

struct DetailView: View {
    
    let title: String
    let posterPath: String
    let date: String
    let overview: String
    
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
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text(overview.isEmpty ? "Description non disponible" : overview)
                    .font(.body)
            }
            .padding()
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
