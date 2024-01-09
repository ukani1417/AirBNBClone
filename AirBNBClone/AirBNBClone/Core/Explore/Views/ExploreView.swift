//
//  ExploreView.swift
//  AirBNBClone
//
//  Created by Dhruv Ukani on 18/12/23.
//

import SwiftUI



struct ExploreView: View {
    
    @State var showSearchView: Bool = false
    @State var searchPlace: String = ""
    @State var numberOfGuest: Int = 0
    
   
    @StateObject var viewModel = ExploreViewModel()
  
    
    var body: some View {
        
        NavigationStack {
                
            if showSearchView == false {
                ScrollView(showsIndicators: false) {
                    searchAndFilterBarView
                    ListView
                }
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing)
                        .navigationBarBackButtonHidden()
                }
            } else {
                DestinationSearchView(showView: $showSearchView,
                                      numberOfGuest: $numberOfGuest,
                                      viewModel: viewModel)
            }
            
        }
    }
    
    var searchAndFilterBarView: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .imageScale(.large)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(viewModel.searchLocation.isEmpty == true ? "Where to?" : viewModel.searchLocation )
                    .font(.footnote)
                    .fontWeight(.semibold)
                    
                Text("Any Week - \(numberOfGuest == 0 ? "Add Guests" : "\(numberOfGuest) Guests")")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            })
            
        }
        .padding([.horizontal, .vertical])
        .overlay {
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray))
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.4), radius: 2)
            
        }
        .padding()
        .onTapGesture {
            withAnimation(.snappy) {
                showSearchView.toggle()
            }
            
        }
    }
    
    var ListView: some View {
        LazyVStack(spacing: 32) {
            ForEach(viewModel.listings) { place in
                NavigationLink(value: place) {
                    ListItemView(place)
                }
            }
        }
    }

}



#Preview {
    ExploreView()
}
