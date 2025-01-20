//
//  ExploreViewModel.swift
//  AirbnbSUI
//
//  Created by Dmitry Volkov on 20/01/2025.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    private let service: ExploreService
    
    init(service: ExploreService) {
        self.service = service
    }
    
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
        } catch {
            print("DEBUG: Failed to fetch data with error: \(error.localizedDescription)")
        }
    }
}
