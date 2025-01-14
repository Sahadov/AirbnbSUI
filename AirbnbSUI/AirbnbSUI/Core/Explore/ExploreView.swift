//
//  ExploreView.swift
//  AirbnbSUI
//
//  Created by Dmitry Volkov on 14/01/2025.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            SearchBar()
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(0...5, id: \.self){listing in
                        NavigationLink(value: listing) {
                            ListingItemView()
                                .frame(height: 400)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                        }
                    }
                }
            }
            .navigationDestination(for: Int.self) {listing in
                Text("Listing detail")
            }
        }
    }
}

#Preview {
    ExploreView()
}
