//
//  ListingImageCarsoulView.swift
//  AirBNBClone
//
//  Created by Dhruv Ukani on 18/12/23.
//

import SwiftUI

struct ListingImageCarsoulView: View {
    
    let images: [String]
    
    init(_ images: [String]) {
        self.images = images
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

