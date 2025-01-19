//
//  DestinationSearchView.swift
//  AirbnbSUI
//
//  Created by Dmitry Volkov on 18/01/2025.
//

import SwiftUI

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var destination = ""
    
    var body: some View {
        VStack{
            Button {
                withAnimation(.snappy) {
                    show.toggle()
                }
            } label: {
                Image(systemName: "xmark.circle")
                    .foregroundStyle(.black)
                    .imageScale(.large)
            }
            VStack (alignment: .leading) {
                Text("Where to?")
                    .font(.title2)
                    .fontWeight(.semibold)
                HStack {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.small)
                    TextField("Search destinations", text: $destination)
                        .font(.subheadline)
                    Spacer()
                }
                .frame(height: 44)
                .padding(.horizontal)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1)
                        .foregroundStyle(Color(.systemGray4))
                )
            }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(true))
}
