//
//  ListingImageCarouselView.swift
//  AirbnbSUI
//
//  Created by Dmitry Volkov on 14/01/2025.
//

import SwiftUI

struct ListingImageCarouselView: View {
    var images = ["apartment_1","apartment_2","apartment_3","apartment_4"]
    
    var body: some View {
        TabView(){
            ForEach(images, id: \.self){image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView()
}
