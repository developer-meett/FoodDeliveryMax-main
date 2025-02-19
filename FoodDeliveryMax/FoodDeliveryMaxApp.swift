//
//  FoodDeliveryMaxApp.swift
//  FoodDeliveryMax
//
//  Created by students on 10/01/2025.
//

import SwiftUI

@main
struct FoodDeliveryMaxApp: App {
    @StateObject private var cityViewModel = CityViewModel()
    @StateObject var favoritesManager = FavoritesManager()
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(cityViewModel)
                .environmentObject(favoritesManager)
        }
    }
}
