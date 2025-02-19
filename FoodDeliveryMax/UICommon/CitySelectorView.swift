//
//  CitySelectorView.swift
//  FoodDeliveryMax
//
//  Created by student on 11/02/25.
//

import SwiftUI

import SwiftUI
import SwiftUI

class CityViewModel: ObservableObject {
    // @Published to automatically notify views when the selected city changes
    @Published var selectedCity: String = "Vadodara"
    @EnvironmentObject var favoritesManager: FavoritesManager
}

struct CitySelectorView: View {
    // Access the shared ViewModel through EnvironmentObject
    @EnvironmentObject var cityViewModel: CityViewModel
    
    // Predefined list of cities
    let cities = [ "New Delhi", "Mumbai", "Bangalore", "Chennai", "Kolkata", "Hyderabad",
                   "Pune", "Ahmedabad", "Surat", "Jaipur", "Chandigarh", "Lucknow", "Indore",
                   "Bhopal", "Kochi", "Coimbatore", "Visakhapatnam", "Nagpur", "Vadodara", "Patna"]
    
    var body: some View {
        VStack {
            Text("Select a City")
                .font(.title)
                .padding(.top, 20)
            
            // Picker for selecting city
            Picker("Select City", selection: $cityViewModel.selectedCity) {
                ForEach(cities, id: \.self) { city in
                    Text(city).tag(city)
                }
            }
            .pickerStyle(WheelPickerStyle())  // You can choose different styles (e.g., default, wheel)
            .frame(height: 150)
            
            Text("Selected City: \(cityViewModel.selectedCity)")
                .padding(.top, 20)
                .font(.headline)
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("City Selector", displayMode: .inline)
    }
}




struct CitySelectorView_Previews: PreviewProvider {
    static var previews: some View {
        CitySelectorView()
            .environmentObject(CityViewModel())
            .environmentObject(FavoritesManager())
    }
}


