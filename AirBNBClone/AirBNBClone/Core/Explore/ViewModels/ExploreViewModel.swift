//
//  ExploreViewModel.swift
//  AirBNBClone
//
//  Created by Dhruv Ukani on 30/12/23.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    @Published var searchLocation: String = ""
    
    private let service: ExploreService
    private var copyListings =  [Listing]()
    
    init(service: ExploreService = ExploreService()) {
        self.service = service
        
        Task { await fetchListing() }
    }
    
    func fetchListing() async {
        do {
            self.listings = try await  service.getListing()
            self.copyListings =  try await  service.getListing()
        } catch  {
            print("Fetching List Error: \(error.localizedDescription )")
        }
    }
    
    func searchPlace() {
        guard  searchLocation.isEmpty == false else {
            self.listings = copyListings
            return
        }
        let filtereadList = copyListings.filter { list in
             list.city.lowercased() == searchLocation.lowercased() || list.state.lowercased() == searchLocation.lowercased() 
        }
        self.listings = filtereadList
    }
    
}
