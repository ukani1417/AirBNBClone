//
//  ARButton.swift
//  AirBNBClone
//
//  Created by Dhruv Ukani on 29/12/23.
//

import SwiftUI

struct ARButton: View {
    
    let width: CGFloat?
    let height: CGFloat?
    let title: String
    let action: () -> Void
    
    init(_ width: CGFloat? = nil,
         _ height: CGFloat? = nil,
         _ title: String ,
         _ action: @escaping () -> Void) {
        self.width = width
        self.height = height
        self.title = title
        self.action = action
    }
    
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .frame(width: width ?? .infinity, 
                       height: height ?? .infinity)
                .background(Color.pink.clipShape(RoundedRectangle(cornerRadius: 8))
        )})
    }
}

#Preview {
    ARButton(350, 48, "login",{})
}
