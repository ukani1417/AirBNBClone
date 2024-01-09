//
//  ListingDetailView.swift
//  AirBNBClone
//
//  Created by Dhruv Ukani on 18/12/23.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    
    
    
    let listing: Listing
    @State private var  cameraPosition: MapCameraPosition
    @Environment(\.dismiss) var dismiss
    
    init(_ listing: Listing) {
        self.listing = listing
        
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: listing.latitude, longitude: listing.longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            ZStack(alignment: .topLeading) {
                ListingImageCarsoulView(listing.imageURLs)
                    .frame(height: 320)
                
                backButton
                   
            }
            
            
            
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
        .toolbar(.hidden, for: .tabBar)
        .padding(.bottom, 85)
        .overlay(alignment: .bottom, content: {
                bookView
                .background(Color.gray.ignoresSafeArea())
        })
        .ignoresSafeArea()
    }
    
    var backButton: some View {
        Button(action: {
            dismiss()
        }, label: {
            Image(systemName: "chevron.left")
                .foregroundColor(.black)
                .background(Circle().fill(.white).frame(width: 32, height: 32))
                .padding(32)
        })
    }
    
    var villaDetailView: some View {
        Group {
            Text(listing.title)
                .font(.title)
                .fontWeight(.semibold)
            
            HStack {
                Image(systemName: "star.fill")
                
                Text("\(listing.rating)")
                Text(" - ")
            
                Text("28 Reviews")
                    .underline()
                    .fontWeight(.semibold)
            }
            .font(.caption)
            
            Text("\(listing.city) ,\(listing.state)")
                .font(.caption)
        }
        .padding(.leading)
    }
    
    var hostView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Entire \(listing.type.description) hosted by \(listing.ownerName)")
                    .font(.headline)
                
                HStack(spacing: 2) {
                    Text("\(listing.numberOfGuests) guests - ")
                    Text("\(listing.numberOfBedrooms) bedrooms - ")
                    Text("\(listing.numberOfBeds) beds - ")
                    Text("\(listing.numberOfBathrooms) baths")
                }
                .font(.caption)
                
            }
            .padding()
            
            Spacer()
            
            Image(listing.ownerImageURL)
                .resizable()
                .scaledToFill()
                .frame( width: 64, height: 64, alignment: .center)
                .clipShape(Circle())
                .padding(.trailing)
        }
    }
    
    var featureListView: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(listing.feature) { item in
                HStack {
                    Image(systemName: item.icon)
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.footnote)
                        Text(item.subTitle)
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
                    ForEach(1...listing.numberOfBedrooms, id:\.self) { bed in
                        VStack(alignment: .leading) {
                            Image(systemName: "bed.double")
                            Text("bedroom \(bed)")
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
            
            ForEach(listing.ameneties) { offer in
                HStack(spacing: 20) {
                    Image(systemName: offer.icon)
                        .frame(width: 32)
                    
                    Text(offer.title)
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
            
            Map(position: $cameraPosition)
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 5))
        }
        .padding()
    }
    
    var bookView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("$ \(listing.pricePerNight)")
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
            
            ARButton(140, 40, "Reserve", {})
                .padding(.trailing, 30)
            
            
        }
        .padding()
        
    
    }
    
    
    
    
    
    
}

