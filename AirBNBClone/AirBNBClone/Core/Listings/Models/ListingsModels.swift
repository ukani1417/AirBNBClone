//
//  ListingsModels.swift
//  AirBNBClone
//
//  Created by Dhruv Ukani on 19/12/23.
//

import Foundation

struct featureItem: Identifiable {
    let id     :  Int
    let icon   :  String
    let title  :  String
    let des    :  String
}

struct bedRoom: Identifiable, Hashable {
    let id     :  Int
    let icon   :  String
    let type   :  String
}

struct placeOffer: Identifiable, Hashable {
    let id    :  Int
    let icon  :  String
    let des   :  String
}

struct Listing: Identifiable, Decodable, Hashable {
    let id                 : String
    let ownerUid           :  String
    let ownerName          :  String
    let ownerImageURL      :  String
    let numberOfBedrooms   :  Int
    let numberOfBathrooms  :  Int
    let numberOfGuests     :  Int
    let numberOfBeds       :  Int
    var pricePerNight      :  Double
    let longitude          :  Double
    let latitude           :  Double
    var imageURLs          :  [String]
    let address            :  String
    let city               :  String
    let state              :  String
    let title              :  String
    var rating             :  Double
    var feature            :  [Listingfeatures]
    var ameneties          :  [ListingAmeneties]
    let type               :  ListingType
}

enum Listingfeatures: Int, Identifiable, Codable, Hashable {
    case selfCheckIn
    case superHost
    
    var id: Int { self.rawValue }
    
    var icon: String {
        switch self {
        case .selfCheckIn  :  "door.left.hand.open"
        case .superHost    :  "medal"
        }
    }
    
    var title: String {
        switch self {
        case .selfCheckIn  :  "Self check-in"
        case .superHost    :  "Superhost"
        }
    }
    
    var subTitle: String {
        switch self {
        case .selfCheckIn  :  "Check your self in with keypad"
        case .superHost    : "Superhost are experinced, hightly rated hosts are who are commited to grate experice"
        }
    }
}

enum ListingAmeneties: Int, Identifiable, Codable, Hashable {
    case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony
    
    var id: Int { self.rawValue }
    
    var title: String {
        switch self {
        case .pool         :  "Pool"
        case .kitchen      :  "Kitchen"
        case .wifi         :   "Wifi"
        case .laundry      :  "Laundry"
        case .tv           :  "Tv"
        case .alarmSystem  :  "Alarm System"
        case .office       :  "Office"
        case .balcony      :  "Balcony"
        }
    }
    
    var icon: String {
        switch self {
        case .pool         :  "figure.pool.swim"
        case .kitchen      :  "fork.knife"
        case .wifi         :  "wifi"
        case .laundry      :  "washer"
        case .tv           :  "tv"
        case .alarmSystem  :  "checkerboard.shield"
        case .office       :  "pencil.and.ruler.fill"
        case .balcony      :  "building"
        }
    }
    
}

enum ListingType: Int, Identifiable, Codable, Hashable {
    
    case apartement
    case house
    case townHouse
    case villa
    
    var id: Int { self.rawValue }
    
    var description: String {
        switch self {
        case .apartement  :  "Apartement"
        case .house       :  "House"
        case .townHouse   :  "Town Home"
        case .villa       :  "Villa"
        }
    }
    
    
}
