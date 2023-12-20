//
//  ListingDetailView.swift
//  AirBNBClone
//
//  Created by Dhruv Ukani on 18/12/23.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    
    private var images: [String] = (1...10).map { index in
        return "\(index)"
    }
    
    private var featureLists: [featureItem] = [
        featureItem(id: 0,
                    icon: "door.left.hand.open",
                    title: "Self-Check in",
                    des: "check your self in with keypad"),
        featureItem(id: 1,
                    icon: "medal",
                    title: "SuperHost",
                    des: "Superhost are experinced, hightly rated hosts are who are commited to grate experice"),

    ]
    
    private var bedRooms: [bedRoom] = [
        bedRoom(id: 1, icon: "bed.double", type: "BedRoom 1"),
        bedRoom(id: 2, icon: "bed.double", type: "BedRoom 2"),
        bedRoom(id: 3, icon: "bed.double", type: "BedRoom 3")
    ]
    
    private var placeOffers: [placeOffer] = [
        placeOffer(id: 1, icon: "wifi", des: "Wifi"),
        placeOffer(id: 2, icon: "shield.checkered", des: "Alert System"),
        placeOffer(id: 3, icon: "square.and.arrow.up", des: "Balcony"),
        placeOffer(id: 4, icon: "washer", des: "Laundry"),
        placeOffer(id: 5, icon: "appletv", des: "TV"),
        
    ]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ListingImageCarsoulView()
                .frame(height: 300)
            
            VStack(alignment: .leading, content: {
                
                villaDetailView
                
                Divider()
                
                hostView
                
                Divider()
                
                featureListView
                
                Divider()
                
                bedsDetailsView
                
                Divider()
                
                placeOfferView
                
                Divider()

                mapView
                
            })
        
        }
        .padding(.bottom, 85)
        .overlay(alignment: .topLeading, content: {
            backButton
        })
        .overlay(alignment: .bottom, content: {
            bookView
        })
        .ignoresSafeArea()
    }
    
    var backButton: some View {
        Button(action: {
            dismiss()
        }, label: {
            Image(systemName: "lessthan.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 30, height: 30, alignment: .center)
                .imageScale(.large)
                .padding(.top, 30)
                .padding(.leading, 20)
                .foregroundStyle(Color.white)
        })
    }
    
    var villaDetailView: some View {
        Group {
            Text("Miami Villa")
                .font(.title)
                .fontWeight(.semibold)
            
            HStack {
                Image(systemName: "star.fill")
                
                Text("4.86")
                Text(" - ")
            
                Text("28 Reviews")
                    .underline()
                    .fontWeight(.semibold)
            }
            .font(.caption)
            
            Text("Miami ,Florida")
                .font(.caption)
        }
        .padding(.leading)
    }
    
    var hostView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Entire villa hosted by John Smith")
                    .font(.headline)
                
                HStack(spacing: 2) {
                    Text("4 guests - ")
                    Text("4 bedrooms - ")
                    Text("4 beds - ")
                    Text("3 baths")
                }
                .font(.caption)
                
            }
            .padding()
            
            Spacer()
            
            Image("userImage")
                .resizable()
                .scaledToFill()
                .frame( width: 64, height: 64, alignment: .center)
                .clipShape(Circle())
                .padding(.trailing)
        }
    }
    
    var featureListView: some View {
        VStack(alignment: .leading) {
            ForEach(featureLists, id:\.id) { item in
                HStack {
                    Image(systemName: item.icon)
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.footnote)
                        Text(item.des)
                            .font(.caption)
                            .foregroundStyle(Color.gray)
                    }
                }
            }
        }
        .padding()
    }
    
    var bedsDetailsView: some View {
        VStack(alignment: .leading) {
            Text("Where you'll sleep")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(bedRooms, id:\.self) { bed in
                        VStack(alignment: .leading) {
                            Image(systemName: bed.icon)
                            Text(bed.type)
                        }
                        .frame(width: 132, height: 100)
                        .padding(.trailing, 30)
                        .background(Color.gray.clipShape(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1)))
                    }
                }
                
            }
            .scrollTargetBehavior(.paging)
        }
        .padding()
    }
    
    var placeOfferView: some View {
    
        VStack(alignment: .leading, spacing: 16) {
            
            Text("What this place offers")
                .font(.headline)
            
            ForEach(placeOffers, id: \.self) { offer in
                HStack(spacing: 20) {
                    Image(systemName: offer.icon)
                        .frame(width: 32)
                    
                    Text(offer.des)
                        .font(.footnote)
                    
                }
            }
        }
        .padding()
    }
    
    var mapView: some View {
        VStack(alignment: .leading) {
            Text("where you will be")
                .font(.headline)
            
            Map()
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 5))
        }
        .padding()
    }
    
    var bookView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("$ 500")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("Total before taxex")
                    .font(.footnote)
                
                Text("Oct 15 - 20")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .underline()
                    
            }
            .padding(.leading)
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Text("Reserve")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 140, height: 40)
                    .foregroundStyle(Color.white)
                    .background(Color.pink.clipShape(RoundedRectangle(cornerRadius: 8)))
                    .padding(.trailing, 30)
            })
            
            
        }
        .padding()
        .background(Color(uiColor: .quaternaryLabel))
        
    }
    
    
    
    
    
    
}

#Preview {
    ListingDetailView()
}
