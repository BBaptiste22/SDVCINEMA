//
//  HomeView.swift
//  SDVCINEMA
//
//  Created by Etudiants on 25/02/2026.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        TabView {
            
            // 🎬 Films
            NavigationStack {
                MovieView()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                // Action recherche à ajouter
                                print("Loupe films cliquée")
                            }) {
                                Image(systemName: "magnifyingglass")
                            }
                        }
                    }
            }
            .tabItem {
                Image(systemName: "film")
                Text("Films")
            }
            
            // 📺 Séries
            NavigationStack {
                SerieView()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                // Action recherche à ajouter
                                print("Loupe séries cliquée")
                            }) {
                                Image(systemName: "magnifyingglass")
                            }
                        }
                    }
            }
            .tabItem {
                Image(systemName: "tv")
                Text("Séries")
            }
            
            // ❤️ Favoris
            Text("Favoris à venir")
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favoris")
                }
        }
    }
}

#Preview {
    HomeView()
}
