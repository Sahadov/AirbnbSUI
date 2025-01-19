//
//  MainTabView.swift
//  AirbnbSUI
//
//  Created by Dmitry Volkov on 18/01/2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem{ Label("Explore", systemImage: "magnifyingglass") }
            
            WishListView()
                .tabItem{ Label("Wishlist", systemImage: "heart") }
            
            ProfileView()
                .tabItem{ Label("Profile", systemImage: "person") }
        }
    }
}

#Preview {
    MainTabView()
}
