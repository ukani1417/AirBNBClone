//
//  ListingImageCarsoulView.swift
//  AirBNBClone
//
//  Created by Dhruv Ukani on 18/12/23.
//

import SwiftUI

struct ListingImageCarsoulView: View {
    
    private var images: [String] = (1...10).map { index in
        return "\(index)"
    }
    
        
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { image  in
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview {
    ListingImageCarsoulView()
}
