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
    var body: some View {
        
        NavigationStack {
            
            if showSearchView == false {
                ScrollView(showsIndicators: false) {
                    
                    SearchAndFilterBar()
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showSearchView.toggle()
                            }
                            
                        }
                        
                    ListView
                    
                }
                .navigationDestination(for: Int.self) { place in
                    ListingDetailView()
                        .navigationBarBackButtonHidden()
                }
            } else {
                DestinationSearchView(showView: $showSearchView, searchedDestination: searchPlace)
            }
            
            
        }
    }
    
    var ListView: some View {
        LazyVStack(spacing: 32) {
            ForEach( 0...3, id: \.self) { place in
                NavigationLink(value: place) {
                    ListItemView()
                }
            }
        }
    }

}



#Preview {
    ExploreView()
}
