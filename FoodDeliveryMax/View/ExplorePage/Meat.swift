//
//  Meat.swift
//  FoodDeliveryMax
//
//  Created by student on 20/02/25.
//

import SwiftUI

struct Meat: View {
    var favoritesViewModel: FavoritesViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                // Header with title and filter icon
                HStack {
                    Spacer()
                    Text("Meat")
                        .font(.customfont(.bold, fontSize: 20))
                        .padding(.leading, 20)
                    Spacer()
                    NavigationLink(destination: FilterView()) {
                        Image("filter_ic") // Your filter icon image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(.trailing)
                    }
                }
                .padding(.top) // Add some top padding to the header
                
                // Scrollable content
                ScrollView {
                    VStack { // Use VStack to stack product rows vertically
                        // First row of products
                        HStack(spacing: 20){
                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Beef Bone",
                                image: "beef_bone",
                                price: "$5.99",
                                description: "1 kg",
                                pdescription: "Beef bones are rich in collagen and minerals."
                            ), favoritesViewModel: favoritesViewModel)
                          
                            
                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Broiler Chicken",
                                image: "broiler_chicken",
                                price: "$2.69",
                                description: "1 kg",
                                pdescription: "Broiler chicken is a good source of protein."
                            ), favoritesViewModel: favoritesViewModel)
                  
                        }.padding()
                        
                        // Second row of products
                        HStack(spacing: 20){
                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Beef Bone",
                                image: "beef_bone",
                                price: "$5.99",
                                description: "1 kg",
                                pdescription: "Beef bones are rich in collagen and minerals."
                            ), favoritesViewModel: favoritesViewModel)
                       
                            
                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Broiler Chicken",
                                image: "broiler_chicken",
                                price: "$2.69",
                                description: "1 kg",
                                pdescription: "Broiler chicken is a good source of protein."
                            ), favoritesViewModel: favoritesViewModel)
                         
                        }.padding()
                            .padding(.top,-10)
                        
                        // Third row of products
                        HStack(spacing: 20){
                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Beef Bone",
                                image: "beef_bone",
                                price: "$5.99",
                                description: "1 kg",
                                pdescription: "Beef bones are rich in collagen and minerals."
                            ), favoritesViewModel: favoritesViewModel)
                          
                            
                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Broiler Chicken",
                                image: "broiler_chicken",
                                price: "$2.69",
                                description: "1 kg",
                                pdescription: "Broiler chicken is a good source of protein."
                            ), favoritesViewModel: favoritesViewModel)
                        
                        }.padding()
                            .padding(.top,-10)
                    }
                }
            }
            .navigationTitle("") // Set an empty title to hide the default title
        }
    }
}


#Preview {
    Meat(favoritesViewModel: FavoritesViewModel.shared)
}
