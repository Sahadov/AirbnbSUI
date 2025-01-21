//
//  DestinationSearchView.swift
//  AirbnbSUI
//
//  Created by Dmitry Volkov on 18/01/2025.
//

import SwiftUI

enum DestinationSearchOption {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @ObservedObject var viewModel: ExploreViewModel
   
    @State private var selectedOption: DestinationSearchOption = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests: Int = 1
    
    
    var body: some View {
        VStack{
            HStack {
                Button {
                    withAnimation(.snappy) {
                        viewModel.updateListingForLocation()
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .foregroundStyle(.black)
                        .imageScale(.large)
                }
                
                Spacer()
                
                if !viewModel.searchLocation.isEmpty {
                    Button("Clear") {
                        viewModel.searchLocation = ""
                        viewModel.updateListingForLocation()
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
            // where to section
            VStack (alignment: .leading) {
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        TextField("Search destinations", text: $viewModel.searchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateListingForLocation()
                                show.toggle()
                            }
                        Spacer()
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color(.systemGray4))
                    )
                } else {
                    CollapsedPickerView(title: "Where to", description: "Add destination")
                }
                
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .location }
            }
            
            // date selection
            VStack(alignment: .leading) {
                if selectedOption == .dates {
                    Text("When is your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    VStack {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        
                        Divider()
                        
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                } else {
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .dates }
            }
            
            
            
            // number of guests
            VStack(alignment: .leading) {
                if selectedOption == .guests {
                    Text("Who is coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Stepper(label: {
                        Text("\(numGuests) guests")
                    }, onIncrement: {
                        numGuests += 1
                    }, onDecrement: {
                        guard numGuests > 1 else { return }
                        numGuests -= 1
                    })
                    .font(.subheadline)
                    .fontWeight(.semibold)
                } else {
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .guests }
            }
            
            Spacer()
            
            
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(true), viewModel: ExploreViewModel(service: ExploreService()))
}

struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}

struct CollapsedPickerView: View {
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}
