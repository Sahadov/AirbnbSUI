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
    @State private var cameraPosition: MapCameraPosition
    let listing: Listing
    
    init(listing: Listing) {
        self.listing = listing
        
        let region = MKCoordinateRegion(center: listing.city == "Los Angeles" ? .losAngeles : .miami,
                                        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView(listing: listing)
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
                Text(listing.title)
                    .font(.title)
                    .fontWeight(.semibold)
                HStack {
                    Label("\(listing.rating)", systemImage: "star.fill")
                    Text("26 reviews")
                        .fontWeight(.semibold)
                        .underline()
                }
                .font(.caption)
                Text("\(listing.city), \(listing.state)")
                    .font(.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            
            Divider()
           
            // Host info
            HStack {
                VStack(alignment: .leading) {
                    Text("Entire \(listing.type) hosted by \(listing.ownerName)")
                        .font(.headline)
                        .frame(maxWidth: 250, alignment: .leading)
                    Text("\(listing.numberOfGuests) guests - \(listing.numberOfBedrooms) bedrooms - \(listing.numberOfBeds) beds - \(listing.numberOfBathrooms) baths")
                        .font(.caption)
                }
                Spacer()
                Image(listing.ownerImageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding()
            
            Divider()
            
            // Badges
            ForEach(listing.features) {feature in
                HStack(spacing: 10) {
                    Image(systemName: feature.imageName)
                    VStack(alignment: .leading) {
                        Text(feature.title)
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Text(feature.subtitle)
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
                        ForEach(1...listing.numberOfBedrooms, id: \.self){room in
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
                ForEach(listing.amenities){feature in
                    Label(feature.title, systemImage: feature.imageName)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            // Map
            VStack(alignment: .leading) {
                Text("Where you'll be")
                    .font(.headline)
                Map(position: $cameraPosition)
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
                        Text("$\(listing.pricePerNight)")
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
    ListingDetailView(listing: DeveloperPreview.shared.listings[0])
}
