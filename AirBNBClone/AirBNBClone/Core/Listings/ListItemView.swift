//
//  ListingView.swift
//  AirBNBClone
//
//  Created by Dhruv Ukani on 18/12/23.
//

import SwiftUI

struct ListItemView: View {
    
    @State private var heartTapped: Bool = false
    
    private var images: [String] = (1...10).map { index in
        return "\(index)"
    }
    
    var body: some View {
        VStack(spacing: 10) {
            ListingImageCarsoulView()
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
                Text("Delhi , India")
                    .bold()
                    .foregroundStyle(.black)
                
                Group {
                    Text("sector 12")
                    Text("Nov 3 - 10")
                }
                .foregroundStyle(.gray)
                
                HStack(spacing: 5) {
                    Text("$567")
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
                Text("4.86")
            }
            .font(.footnote)
            .bold()
            .foregroundStyle(.black)
        }
        
    }

}

#Preview {
    ListItemView()
}
