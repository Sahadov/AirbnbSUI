//
//  DeveloperPreview.swift
//  AirbnbSUI
//
//  Created by Dmitry Volkov on 19/01/2025.
//

import Foundation

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    var listings: [Listing] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImageUrl: "Host-1",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7850,
            longtitude: -80.1936,
            imageUrls: ["apartment_1", "apartment_2", "apartment_3", "apartment_4"],
            address: "124  Main St",
            city: "Miami",
            state: "Florida",
            title: "Miami Villa",
            rating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Sam Favio",
            ownerImageUrl: "Host-1",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7856,
            longtitude: -80.1340,
            imageUrls: ["apartment_1", "apartment_2", "apartment_3", "apartment_4"],
            address: "124  Main St",
            city: "Los Angeles",
            state: "California",
            title: "Angels Villa",
            rating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Luiza Petro",
            ownerImageUrl: "Host-1",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 34.2,
            longtitude: -118.0426,
            imageUrls: ["apartment_1", "apartment_2", "apartment_3", "apartment_4"],
            address: "124  Main St",
            city: "Miami",
            state: "Florida",
            title: "Miami Villa",
            rating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Andrew Toros",
            ownerImageUrl: "Host-1",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 34.2,
            longtitude: -118.0426,
            imageUrls: ["apartment_1", "apartment_2", "apartment_3", "apartment_4"],
            address: "124  Main St",
            city: "Los Angeles",
            state: "California",
            title: "Los Villa Paradise",
            rating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        )
    ]
}
