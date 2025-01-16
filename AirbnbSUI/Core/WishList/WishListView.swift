//
//  WishListView.swift
//  AirbnbSUI
//
//  Created by Dmitry Volkov on 15/01/2025.
//

import SwiftUI

struct WishListView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Log in to view your wishlist")
                        .fontWeight(.semibold)
                    Text("You can create, view or edit wishlists once you've logged in")
                        .font(.footnote)
                }
                Button {
                } label: {
                    LoginButtonView()
                }
                Spacer()
            }
            .padding()
            .navigationTitle("WishList")

        }
    }
}

#Preview {
    WishListView()
}
