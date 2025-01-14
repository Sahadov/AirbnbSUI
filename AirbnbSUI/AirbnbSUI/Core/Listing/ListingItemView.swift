//
//  ListingView.swift
//  AirbnbSUI
//
//  Created by Dmitry Volkov on 14/01/2025.
//

import SwiftUI

struct ListingItemView: View {
    var images = ["apartment_1","apartment_2","apartment_3","apartment_4"]
    
    var body: some View {
        VStack(spacing: 8) {
            // Image carousel
            TabView(){
                ForEach(images, id: \.self){image in
                    Image(image)
                        .resizable()
                        .scaledToFill()
                }
            }
            .frame(height: 320)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .tabViewStyle(.page)
            
            // Lisitng info
            HStack(alignment: .top) {
                // Details
                VStack(alignment: .leading) {
                    Text("Miami, Florida")
                        .fontWeight(.semibold)
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    Text("Novem 12 - 15")
                        .foregroundStyle(.gray)
                    HStack(spacing: 4) {
                        Text("$567")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                }
                Spacer()
                // Rating
                Label("4.86", systemImage: "star.fill")
            
            }
            .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    ListingItemView()
}
