//
//  Fruits.swift
//  FoodDeliveryMax
//
//  Created by student on 20/02/25.
//

import SwiftUI

struct Fruits: View {
    var favoritesViewModel: FavoritesViewModel
    var body: some View {
        VStack{
            HStack {
                ProductItemView(product: Product(
                    id: UUID(),
                    name: "Beef Bone",
                    image: "beef_bone",
                    price: "$5.99",
                    description: "1 kg",
                    pdescription: "Beef bones are rich in collagen and minerals."
                ), favoritesViewModel: favoritesViewModel)
                .padding(.leading, 6)
                
                ProductItemView(product: Product(
                    id: UUID(),
                    name: "Broiler Chicken",
                    image: "broiler_chicken",
                    price: "$2.69",
                    description: "1 kg",
                    pdescription: "Broiler chicken is a good source of protein."
                ), favoritesViewModel: favoritesViewModel)
                .padding(.leading, 6)
                }
            HStack {
                ProductItemView(product: Product(
                    id: UUID(),
                    name: "Beef Bone",
                    image: "beef_bone",
                    price: "$5.99",
                    description: "1 kg",
                    pdescription: "Beef bones are rich in collagen and minerals."
                ), favoritesViewModel: favoritesViewModel)
                .padding(.leading, 6)
                
                ProductItemView(product: Product(
                    id: UUID(),
                    name: "Broiler Chicken",
                    image: "broiler_chicken",
                    price: "$2.69",
                    description: "1 kg",
                    pdescription: "Broiler chicken is a good source of protein."
                ), favoritesViewModel: favoritesViewModel)
                .padding(.leading, 6)
                
                
            }
            HStack {
                ProductItemView(product: Product(
                    id: UUID(),
                    name: "Beef Bone",
                    image: "beef_bone",
                    price: "$5.99",
                    description: "1 kg",
                    pdescription: "Beef bones are rich in collagen and minerals."
                ), favoritesViewModel: favoritesViewModel)
                .padding(.leading, 6)
                
                ProductItemView(product: Product(
                    id: UUID(),
                    name: "Broiler Chicken",
                    image: "broiler_chicken",
                    price: "$2.69",
                    description: "1 kg",
                    pdescription: "Broiler chicken is a good source of protein."
                ), favoritesViewModel: favoritesViewModel)
                .padding(.leading, 6)
                
                
            }
        }
    }
}

#Preview {
    Fruits(favoritesViewModel: FavoritesViewModel.shared)
}
