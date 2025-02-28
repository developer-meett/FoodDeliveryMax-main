import SwiftUI

struct Beverages: View {
    var favoritesViewModel: FavoritesViewModel
    var cartViewModel: CartViewModel
    @State private var showFilterView = false
    var body: some View {
        NavigationView {
            VStack {
                // Header with title and filter icon
                HStack {
                    Spacer()
                    Text("Beverages")
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
                                name: "Diet Coke",
                                image: "diet_coke",
                                price: "$1.99",
                                description: "500 ml",
                                pdescription: "A refreshing sugar-free cola with a crisp taste."
                            ), favoritesViewModel: favoritesViewModel, cartViewModel: cartViewModel)
                          
                            
                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Apple Grape Juice",
                                image: "juice_apple_grape",
                                price: "$3.49",
                                description: "1 liter",
                                pdescription: "A mix of apple and grape juice with a sweet, fruity flavor."
                            ), favoritesViewModel: favoritesViewModel, cartViewModel: cartViewModel)
                  
                        }.padding()
                        
                        // Second row of products
                        HStack(spacing: 20){
                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Pepsi Can",
                                image: "pepsi_can",
                                price: "$1.49",
                                description: "330 ml",
                                pdescription: "A classic carbonated soft drink with a bold flavor."
                            ), favoritesViewModel: favoritesViewModel, cartViewModel: cartViewModel)
                       
                            
                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Orange Juice",
                                image: "orenge_juice",
                                price: "$2.99",
                                description: "1 liter",
                                pdescription: "Freshly squeezed orange juice, full of vitamin C."
                            ), favoritesViewModel: favoritesViewModel, cartViewModel: cartViewModel)
                         
                        }.padding()
                            .padding(.top,-10)
                        
                        // Third row of products
                        HStack(spacing: 20){
                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Diet Coke",
                                image: "diet_coke",
                                price: "$1.99",
                                description: "500 ml",
                                pdescription: "A refreshing sugar-free cola with a crisp taste."
                            ), favoritesViewModel: favoritesViewModel, cartViewModel: cartViewModel)
                          
                            
                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Coca Cola Can",
                                image: "cocacola_can",
                                price: "$1.49",
                                description: "330 ml",
                                pdescription: "A classic cola with a refreshing, sweet taste."
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
    Beverages(favoritesViewModel: FavoritesViewModel.shared, cartViewModel: CartViewModel())
}
