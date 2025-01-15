//
//  ListingDetailView.swift
//  AirbnbSUI
//
//  Created by Dmitry Volkov on 14/01/2025.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    @Environment(\.dismiss) var dismiss // Dismiss button action
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView()
                    .frame(height: 320)
                
                Button{
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32) // Important to put padding on the image, otherwise it'll be unclicable
                }
                
            }
            // House info
            VStack(alignment: .leading, spacing: 5) {
                Text("Miami Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                HStack {
                    Label("4.86 -", systemImage: "star.fill")
                    Text("26 reviews")
                        .fontWeight(.semibold)
                        .underline()
                }
                .font(.caption)
                Text("Miami, Florida")
                    .font(.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            
            Divider()
           
            // Host info
            HStack {
                VStack(alignment: .leading) {
                    Text("Entire villa hosted by John Smith")
                        .font(.headline)
                        .frame(maxWidth: 250, alignment: .leading)
                    Text("4 guests - 4 bedrooms - 4 beds - 4 baths")
                        .font(.caption)
                }
                Spacer()
                Image("Host-1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding()
            
            Divider()
            
            // Badges
            ForEach(0 ..< 2) {feature in
                HStack(spacing: 10) {
                    Image(systemName: "star")
                    VStack(alignment: .leading) {
                        Text ("Self check-in")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Text("Check yourself in with the keypad")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical, 5)
            }
            
            Divider()
            
            // Rooms
            VStack(alignment: .leading, spacing: 15) {
                Text("Where you'll sleep")
                    .font(.headline)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(1 ..< 5){room in
                            VStack {
                                Image(systemName: "bed.double")
                                Text("Bedroom \(room)")
                            }
                            .frame(width: 132, height: 100)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
            .padding()
            
            Divider()
            // Facilities
            VStack(alignment: .leading, spacing: 16) {
                Text("What this place offers")
                    .font(.headline)
                ForEach(0 ..< 5){feature in
                    Label("Wi-Fi", systemImage: "wifi")
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            // Map
            VStack(alignment: .leading) {
                Text("Where you'll be")
                    .font(.headline)
                Map()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
            
        }
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("$500")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before taxes")
                            .font(.footnote)
                        
                        Text("Oct 15 - 20")
                            .font(.footnote)
                            .underline()
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal, 32)
                
            }
        }
        .background(.white)
        
    }
}

#Preview {
    ListingDetailView()
}
