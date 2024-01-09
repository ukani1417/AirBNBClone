//
//  ExploreService.swift
//  AirBNBClone
//
//  Created by Dhruv Ukani on 30/12/23.
//

import Foundation

class ExploreService {
    func getListing() async throws -> [Listing] {
        return DevPreView.shared.listing
    }
}
