//
//  DevPreView.swift
//  AirBNBClone
//
//  Created by Dhruv Ukani on 30/12/23.
//

import Foundation

class DevPreView {
    
    static let shared = DevPreView()
    
    var listing: [Listing] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImageURL: "userImage",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567.0,
            longitude: 25.7850,
            latitude: -80.1936,
            imageURLs: ["1","2","3","4","5"],
            address: "124 Main St",
            city: "Miami",
            state: "Florida",
            title: "Miami Villa",
            rating: 4.86,
            feature: [.selfCheckIn, .superHost],
            ameneties: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Dhruv Ukani",
            ownerImageURL: "userImage",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567.0,
            longitude: 25.7850,
            latitude: -80.1936,
            imageURLs: ["6","7","8","9","10"],
            address: "124 Main St",
            city: "Delhi",
            state: "Florida",
            title: "Miami Villa",
            rating: 4.86,
            feature: [.selfCheckIn, .superHost],
            ameneties: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        )
    ]
}
