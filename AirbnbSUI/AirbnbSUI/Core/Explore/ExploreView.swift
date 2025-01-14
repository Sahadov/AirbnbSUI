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
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(0...5, id: \.self){listing in
                        ListingItemView()
                            .frame(height: 400)
                    }
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
