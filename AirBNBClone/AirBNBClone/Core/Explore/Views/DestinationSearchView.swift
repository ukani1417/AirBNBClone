//
//  SearchDestionView.swift
//  AirBNBClone
//
//  Created by Dhruv Ukani on 19/12/23.
//

import SwiftUI

enum DestinationSearchConteType {
    case search
    case dates
    case members
}

struct DestinationSearchView: View {
    
    @Binding var showView: Bool
    @Binding var numberOfGuest: Int
    
    @State var fromDate: Date = .now
    @State var toDate: Date = Date(timeInterval: TimeInterval(integerLiteral: 5), since: .now)
    @State var selectedContentType: DestinationSearchConteType = .search
    
    @ObservedObject var viewModel: ExploreViewModel
    
    var body: some View {
        VStack(spacing: 40) {
            
            searchTextView
            whenView
            whoView
            
            Spacer()
            
        }
        .padding(.top, 50)
        .overlay(alignment: .topLeading) {
            closeButton
        }
    }
    
    var closeButton: some View {
        Button(action: {
            
            if viewModel.searchLocation.isEmpty {
                viewModel.searchPlace()
            }
            
            withAnimation {
                showView.toggle()
            }
        }, label: {
            Image(systemName: "xmark.circle")
                .imageScale(.large)
                .foregroundColor(Color.primary)
            
        })
    }
    
    var searchTextView: some View {
        VStack(alignment: .leading) {
            if selectedContentType == .search {
                bodyView(title: "Where to?",
                         contentView: searchView)
            } else {
                closeView(title: "Where", subTitle: viewModel.searchLocation.isEmpty == true  ? "Add Destinations" : viewModel.searchLocation)
            }
        }
        .modifier(searchViewModifire())
        .onTapGesture {
            withAnimation {
                selectedContentType = .search
            }
            
        }
    }
    
    var searchView: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            TextField("search destinations", text: $viewModel.searchLocation)
                .font(.subheadline)
                .onSubmit {
                    viewModel.searchPlace()
                    withAnimation {
                        showView.toggle()
                    }
                }
            
        }
        .padding()
        .background(Color.gray.clipShape(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1)))
    }
    
    var datesView: some View {
        VStack {
            DatePicker("From", selection: $fromDate, displayedComponents: .date)
    
            Divider()
            
            DatePicker("To", selection: $toDate, in: fromDate..., displayedComponents: .date)
                
        }
        .font(.subheadline)
        .fontWeight(.semibold)
        .foregroundStyle(Color.gray)
    }
    
    var guestCountView: some View {
        Stepper( onIncrement: {
            numberOfGuest += 1
        },onDecrement: {
            if numberOfGuest > 0 { numberOfGuest -= 1 }
        }, label: {
            Text("\(numberOfGuest) Adults")
        })
        .onSubmit {
            withAnimation {
                showView.toggle()
            }
        }
    }
    
    var whenView: some View {
        VStack(alignment: .leading) {
            
            if selectedContentType == .dates {
                bodyView(title: "When's your trip?", contentView: datesView)
                
            } else {
                closeView(title: "When", subTitle: "Add Dates")
            }
        }
        .modifier(searchViewModifire())
        .onTapGesture {
            withAnimation {
                selectedContentType = .dates
            }
            
        }
        
    }
    
    var whoView: some View {
        VStack(alignment: .leading) {
            if selectedContentType == .members {
                bodyView(title: "Whos's Coming?", contentView: guestCountView)
            } else {
                
                closeView(title: "Who", subTitle: numberOfGuest == 0 ? "Add Guests" : "\(numberOfGuest) Guests")
            }
        }
        .modifier(searchViewModifire())
        .onTapGesture {
            withAnimation {
                selectedContentType = .members
            }
            
        }
    }
    
    // Methods & Struct Views
    
    
    struct searchViewModifire: ViewModifier {
        func body(content: Content) -> some View {
            content
                .padding(.horizontal, 20)
                .padding(.vertical, 30)
                .frame(width: UIScreen.main.bounds.width - 32)
                .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 10)).shadow(color: .gray, radius: 10))
        }
    }
    
    struct closeView: View {
        let title: String
        let subTitle: String
        
        var body: some View {
            HStack {
                Text(title)
                    .foregroundStyle(Color.gray)
                Spacer()
                
                Text(subTitle)
                    .fontWeight(.semibold)
            }
        }
    }
    
    struct bodyView<Content: View>: View {
        
        let title: String
        let contentView: Content
        var body: some View {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                contentView
            }
        }
    }
    
}
