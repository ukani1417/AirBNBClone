//
//  ListingsModels.swift
//  AirBNBClone
//
//  Created by Dhruv Ukani on 19/12/23.
//

import Foundation

struct featureItem: Identifiable {
    let id: Int
    let icon: String
    let title: String
    let des: String
}

struct bedRoom: Identifiable, Hashable {
    let id: Int
    let icon: String
    let type: String
}

struct placeOffer: Identifiable, Hashable {
    let id: Int
    let icon: String
    let des: String
}
