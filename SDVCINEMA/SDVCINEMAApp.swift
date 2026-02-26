//
//  SDVCINEMAApp.swift
//  SDVCINEMA
//
//  Created by Etudiants on 25/02/2026.
//

import SwiftUI
import SwiftData

@main
struct SDVCINEMAApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .preferredColorScheme(.dark)
        }
        .modelContainer(for: Favorite.self)
        
    }
}


