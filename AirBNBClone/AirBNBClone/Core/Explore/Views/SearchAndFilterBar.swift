//
//  SearchAndFilterBar.swift
//  AirBNBClone
//
//  Created by Dhruv Ukani on 18/12/23.
//

import SwiftUI

struct SearchAndFilterBar: View {
    
    
    @Binding var searchPlaced: String
    @Binding var numberOfGuest: Int
    
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .imageScale(.large)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(searchPlaced.isEmpty == true ? "Where to?" : searchPlaced )
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
        
         
    }
}

