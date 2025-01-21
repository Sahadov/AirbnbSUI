//
//  ExploreView.swift
//  AirbnbSUI
//
//  Created by Dmitry Volkov on 14/01/2025.
//

import SwiftUI

struct ExploreView: View {
    @State var showDestinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        NavigationStack {
            
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView, viewModel: viewModel)
            } else {
                SearchBar(location: $viewModel.searchLocation)
                    .onTapGesture {
                        withAnimation(.snappy) {
                            showDestinationSearchView.toggle()
                        }
                    }
                ScrollView {
                    LazyVStack(spacing: 32) {
                        ForEach(viewModel.listings){ listing in
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing)
                                    .frame(height: 400)
                                
                            }
                        }
                    }
                }
                .navigationDestination(for: Listing.self) {listing in
                    ListingDetailView(listing: listing)
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
