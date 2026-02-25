//
//  SerieViewModel.swift
//  SDVCINEMA
//
//  Created by Etudiants on 25/02/2026.
//

import Foundation
import Combine

class SerieViewModel: ObservableObject {
    
    @Published var series: [Serie] = []
    
    private let apiService = ApiService()
    
    func fetchSeries() {
        apiService.fetchPopularSeries { series in
            DispatchQueue.main.async {
                self.series = series ?? []
            }
        }
    }
}
