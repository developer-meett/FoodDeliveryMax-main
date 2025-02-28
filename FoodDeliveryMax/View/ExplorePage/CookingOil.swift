//
//  CookingOil.swift
//  FoodDeliveryMax
//
//  Created by student on 20/02/25.
//

import SwiftUI

struct CookingOil: View {
    var favoritesViewModel: FavoritesViewModel
    var cartViewModel: CartViewModel
    @State private var showFilterView = false
    var body: some View {
        NavigationView {
            VStack {
                // Header with title and filter icon
                HStack {
                    Spacer()
                    Text("CookingOil 🍯")
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
                            ), favoritesViewModel: favoritesViewModel, cartViewModel: cartViewModel)
                          
                            
                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Broiler Chicken",
                                image: "broiler_chicken",
                                price: "$2.69",
                                description: "1 kg",
                                pdescription: "Broiler chicken is a good source of protein."
                            ), favoritesViewModel: favoritesViewModel, cartViewModel: cartViewModel)
                  
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
                            ), favoritesViewModel: favoritesViewModel, cartViewModel: cartViewModel)
                       
                            
                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Broiler Chicken",
                                image: "broiler_chicken",
                                price: "$2.69",
                                description: "1 kg",
                                pdescription: "Broiler chicken is a good source of protein."
                            ), favoritesViewModel: favoritesViewModel, cartViewModel: cartViewModel)
                         
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
                            ), favoritesViewModel: favoritesViewModel, cartViewModel: cartViewModel)
                          
                            
                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Broiler Chicken",
                                image: "broiler_chicken",
                                price: "$2.69",
                                description: "1 kg",
                                pdescription: "Broiler chicken is a good source of protein."
                            ), favoritesViewModel: favoritesViewModel, cartViewModel: cartViewModel)
                        
                        }.padding()
                            .padding(.top,-10)
                    }
                }
            }
            .navigationTitle("") // Set an empty title to hide the default title
        }
        if showFilterView {
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    withAnimation {
                        showFilterView = false
                    }
                }
            
            FilterView(onClose: {
                withAnimation {
                    showFilterView = false
                }
            })
            .transition(.move(edge: .bottom)) // Animate from the bottom
            .animation(.easeInOut, value: showFilterView)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding(.bottom, 20)
            .offset(y: showFilterView ? 0 : UIScreen.main.bounds.height)
        }
    }
}


#Preview {
    CookingOil(favoritesViewModel: FavoritesViewModel.shared, cartViewModel: CartViewModel())
}
