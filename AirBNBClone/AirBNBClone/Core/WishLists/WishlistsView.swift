//
//  WishListsView.swift
//  AirBNBClone
//
//  Created by Dhruv Ukani on 29/12/23.
//

import SwiftUI

struct WishlistsView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32) {
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Log in to view your wishlists.")
                        .fontWeight(.semibold)
                    
                    Text("You can create, view or edit your wishlists once you've logged in")
                        .font(.subheadline)
                }
                .padding(.leading, 32)
                
                ARButton(360, 48, "Login", {})
                
                Spacer()
                
            }
            .padding(.top, 32)
            .navigationTitle("Wishlists")
           
        }
        
       
        
    }
}

#Preview {
    WishlistsView()
}
