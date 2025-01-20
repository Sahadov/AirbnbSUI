//
//  ExploreService.swift
//  AirbnbSUI
//
//  Created by Dmitry Volkov on 20/01/2025.
//

import Foundation

class ExploreService {
    func fetchListings() async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
