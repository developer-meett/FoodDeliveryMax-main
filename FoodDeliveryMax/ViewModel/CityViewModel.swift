//
//  CityViewModel.swift
//  FoodDeliveryMax
//
//  Created by student on 20/02/25.
//

import Foundation

class CityViewModel: ObservableObject {
    // @Published to automatically notify views when the selected city changes
    @Published var selectedCity: String = "Vadodara"
}
