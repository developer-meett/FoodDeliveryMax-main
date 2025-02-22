//
//  Bakery.swift
//  FoodDeliveryMax
//
//  Created by student on 20/02/25.
//

import SwiftUI

struct Bakery: View {
    var favoritesViewModel: FavoritesViewModel
    @State private var showFilterView = false 
    var body: some View {
        NavigationView {
            VStack {
                // Header with title and filter icon
                HStack {
                    Spacer()
                    Text("Bakery and Snacks")
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
                                name: "Rusks",
                                image: "rr",
                                price: "$5.99",
                                description: "1 kg",
                                pdescription: "Rusks are a crunchy, twice-baked bread treat."
                            ), favoritesViewModel: favoritesViewModel)
                          
                            
                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Burger Buns",
                                image: "bb",
                                price: "$2.69",
                                description: "1 kg",
                                pdescription: "Burger buns are soft, fluffy, and perfect for sandwiches."
                            ), favoritesViewModel: favoritesViewModel)
                  
                        }.padding()
                        
                        // Second row of products
                        HStack(spacing: 20){
                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Jalepeno bagels",
                                image: "jp",
                                price: "$5.99",
                                description: "1 kg",
                                pdescription: "Jalapeno bagels are a spicy twist on a classic breakfast treat."
                            ), favoritesViewModel: favoritesViewModel)
                       
                            
                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Egg noodles",
                                image: "egg_noodies_new",
                                price: "$2.69",
                                description: "1 kg",
                                pdescription: "Egg noodles are a versatile, soft pasta perfect for stir-fries."
                            ), favoritesViewModel: favoritesViewModel)
                         
                        }.padding()
                            .padding(.top,-10)
                        
                        // Third row of products
                        HStack(spacing: 20){
                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "egg pasta",
                                image: "egg_pasta",
                                price: "$5.99",
                                description: "1 kg",
                                pdescription: "egg pasta are perfect for making rich, flavorful broths."
                            ), favoritesViewModel: favoritesViewModel)
                          
                            
                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Rusks",
                                image: "rr",
                                price: "$2.69",
                                description: "1 kg",
                                pdescription: "Rusks are crunchy and great as a snack or with tea."
                            ), favoritesViewModel: favoritesViewModel)
                        
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
    Bakery(favoritesViewModel: FavoritesViewModel.shared)
}
