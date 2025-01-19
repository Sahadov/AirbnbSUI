//
//  ExploreView.swift
//  AirbnbSUI
//
//  Created by Dmitry Volkov on 14/01/2025.
//

import SwiftUI

struct ExploreView: View {
    @State var showDestinationSearchView = false
    
    var body: some View {
        NavigationStack {
            
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView)
            } else {
                SearchBar()
                    .onTapGesture {
                        withAnimation(.snappy) {
                            showDestinationSearchView.toggle()
                        }
                    }
                ScrollView {
                    LazyVStack(spacing: 32) {
                        ForEach(0...5, id: \.self){listing in
                            NavigationLink(value: listing) {
                                ListingItemView()
                                    .frame(height: 400)
                                
                            }
                        }
                    }
                }
                .navigationDestination(for: Int.self) {listing in
                    ListingDetailView()
                        .navigationBarBackButtonHidden()
                        .navigationBarHidden(true)
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
