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
            
            NavigationStack {
                MovieView()
            }
            .tabItem {
                Image(systemName: "film.fill")
                Text("Films")
            }
            
            NavigationStack {
                SerieView()
            }
            .tabItem {
                Image(systemName: "tv.fill")
                Text("Séries")
            }
            
            FavoritesView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favoris")
                }
        }
    }
}

#Preview {
    HomeView()
}
