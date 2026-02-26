//
//  SerieView.swift
//  SDVCINEMA
//
//  Created by Etudiants on 25/02/2026.
//

import SwiftUI

struct SerieView: View {
    
    @StateObject var viewModel = SerieViewModel()
    
    @State private var searchText = ""

    var filteredSeries: [Serie] {
        if searchText.isEmpty {
            return viewModel.series
        } else {
            return viewModel.series.filter {
                $0.searchableTitle.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            
            List(filteredSeries) { serie in
                
                NavigationLink(destination:
                    DetailView(
                        id: serie.id,
                        title: serie.name,
                        posterPath: serie.posterPath,
                        date: serie.firstAirDate,
                        overview: serie.overview
                    )
                ) {
                    HStack(spacing: 16) {
                        
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(serie.posterPath)")) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 80, height: 120)
                        .cornerRadius(8)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            
                            Text(serie.name)
                                .font(.headline)
                            
                            Text(serie.firstAirDate)
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
