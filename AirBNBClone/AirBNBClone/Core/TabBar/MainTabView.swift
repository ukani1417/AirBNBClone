//
//  AppTabbar.swift
//  AirBNBClone
//
//  Created by Dhruv Ukani on 29/12/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExploreView().tabItem { 
                Label("Explore", systemImage: "magnifyingglass") }.tag(1)
            WishlistsView().tabItem { 
                Label("Wishlists", systemImage: "suit.heart.fill") }.tag(2)
            ProfileView().tabItem { 
                Label("Profile", systemImage: "person.crop.circle.fill") }.tag(3)
        }
    }

}




#Preview {
    MainTabView()
}
