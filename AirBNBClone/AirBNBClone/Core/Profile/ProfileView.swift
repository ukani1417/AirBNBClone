//
//  ProfileView.swift
//  AirBNBClone
//
//  Created by Dhruv Ukani on 29/12/23.
//

import SwiftUI



struct ProfileView: View {
    var body: some View {
        
        VStack {
            VStack(alignment: .leading, spacing: 32) {
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                }
                
                
                Text("Log in to start planning your trip")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                ARButton(360, 46, "Login", {})
                
                HStack {
                    Text("Don't have an account?")
                    Text("Sign UP")
                        .fontWeight(.semibold)
                        .underline()
                }
                .font(.caption)
                
            }
            
            settingView
                .padding(.vertical)
        }
        .padding()
        
        
    }
    
    var settingView: some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack {
                Image(systemName: "gear")
                Text("Settings")
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            
            
            Divider()
            
            HStack {
                Image(systemName: "gear")
                Text("Accessbility")
                
                Spacer()
                
                Image(systemName:  "chevron.right")
            }
            
            
            Divider()
            
            HStack {
                Image(systemName: "questionmark.circle")
                Text("Visit Help Center")
                
                Spacer()
                
                Image(systemName:  "chevron.right")
            }
            
            
            Divider()
            
        }
       
        
        
    }
    
}

#Preview {
    ProfileView()
}
