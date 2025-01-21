//
//  ListingImageCarouselView.swift
//  AirbnbSUI
//
//  Created by Dmitry Volkov on 14/01/2025.
//

import SwiftUI

struct ListingImageCarouselView: View {
    var listing: Listing
    
    var body: some View {
        TabView(){
            ForEach(listing.imageUrls, id: \.self){image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(listing: DeveloperPreview.shared.listings[0])
}
