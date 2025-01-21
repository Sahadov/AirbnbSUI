//
//  SearchBar.swift
//  AirbnbSUI
//
//  Created by Dmitry Volkov on 14/01/2025.
//

import SwiftUI
struct SearchBar: View {
    @Binding var location: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            VStack(alignment: .leading, spacing: 2) {
                Text(location.isEmpty ? "Where to?" : location)
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("\(location.isEmpty ? "Anywhere - " : "")Any week - Add guests")
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            Button {} label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            }

        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        // Border
        .overlay {
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: .black.opacity(0.4), radius: 2)
        }
        .padding()
    }
}

#Preview {
    SearchBar(location: .constant("Los Angeles"))
}
