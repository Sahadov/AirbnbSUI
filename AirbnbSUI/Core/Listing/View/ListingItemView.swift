//
//  ListingView.swift
//  AirbnbSUI
//
//  Created by Dmitry Volkov on 14/01/2025.
//

import SwiftUI

struct ListingItemView: View {
    let listing: Listing
    
    var body: some View {
        VStack(spacing: 8) {
            // Image carousel
            ListingImageCarouselView(listing: listing)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(height: 320)
            
            // Lisitng info
            HStack(alignment: .top) {
                // Details
                VStack(alignment: .leading) {
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    Text("Novem 12 - 15")
                        .foregroundStyle(.gray)
                    HStack(spacing: 4) {
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        Text("night")
                            .foregroundStyle(.black)
                    }
                }
                Spacer()
                // Rating
                Label(String(listing.rating), systemImage: "star.fill")
                    .foregroundStyle(.black)
            
            }
            .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
