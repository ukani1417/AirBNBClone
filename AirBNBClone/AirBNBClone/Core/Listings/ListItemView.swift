//
//  ListingView.swift
//  AirBNBClone
//
//  Created by Dhruv Ukani on 18/12/23.
//

import SwiftUI

struct ListItemView: View {
    
    @State private var heartTapped: Bool = false
    let list: Listing
    
    init(_ list: Listing) {
        self.list = list
    }
    
    var body: some View {
        VStack(spacing: 10) {
            ListingImageCarsoulView(list.imageURLs)
                .frame(height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
            detailView
        }
        .overlay(alignment: .topTrailing) {
            Image(systemName: heartTapped == false ? "heart" : "heart.fill")
                .padding()
                .foregroundColor(Color.white)
                .onTapGesture {
                    heartTapped.toggle()
                }
        }
        .padding()
    }
    
    var detailView: some View {
        
        HStack(alignment: .top) {
            
            // Details
            
            VStack(alignment: .leading) {
                Text("\(list.city) , \(list.state)")
                    .bold()
                    .foregroundStyle(.black)
                
                Group {
                    Text(list.address)
                    Text("Nov 3 - 10")
                }
                .foregroundStyle(.gray)
                
                HStack(spacing: 5) {
                    Text("$\(list.pricePerNight)")
                    Text("night")
                }
                .fontWeight(.semibold)
                .foregroundStyle(.black)
            }
            .font(.footnote)
            
            
            Spacer()
            
            // Ratings
            HStack {
                Image(systemName: "star.fill")
                Text("\(list.rating)")
            }
            .font(.footnote)
            .bold()
            .foregroundStyle(.black)
        }
        
    }

}

