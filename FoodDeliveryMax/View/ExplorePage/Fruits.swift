import SwiftUI

struct Fruits: View {
    var favoritesViewModel: FavoritesViewModel
    @State private var showFilterView = false // State variable to control the filter view
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    HStack {
                        Spacer()
                        Text("Fruits and vegetables")
                            .font(.customfont(.bold, fontSize: 20))
                            .padding(.leading, 20)
                        Spacer()
                        Button(action: {
                            withAnimation {
                                showFilterView.toggle() // Toggle the filter view with animation
                            }
                        }) {
                            Image("filter_ic")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(.trailing)
                        }
                    }
                    .padding(.top)
                    
                    ScrollView {
                        VStack {
                            HStack(spacing: 20) {
                                ProductItemView(product: Product(
                                    id: UUID(),
                                    name: "Apple",
                                    image: "apple",
                                    price: "$3.99",
                                    description: "1 kg",
                                    pdescription: "Fresh and juicy apples, rich in fiber and vitamin C."
                                ), favoritesViewModel: favoritesViewModel)
                                
                                ProductItemView(product: Product(
                                    id: UUID(),
                                    name: "Banana",
                                    image: "banana",
                                    price: "$2.49",
                                    description: "1 kg",
                                    pdescription: "Ripe bananas packed with potassium and natural sweetness."
                                ), favoritesViewModel: favoritesViewModel)
                            }
                            .padding()
                            
                            // Second row of products
                            HStack(spacing: 20) {
                                ProductItemView(product: Product(
                                    id: UUID(),
                                    name: "Ginger",
                                    image: "ginger",
                                    price: "$4.49",
                                    description: "250 gm",
                                    pdescription: "Fresh ginger, known for its anti-inflammatory properties."
                                ), favoritesViewModel: favoritesViewModel)
                                
                                ProductItemView(product: Product(
                                    id: UUID(),
                                    name: "Bell Paper Red",
                                    image: "bell_pepper_red",
                                    price: "$3.79",
                                    description: "1 kg",
                                    pdescription: "Sweet red bell peppers full of vitamins A and C."
                                ), favoritesViewModel: favoritesViewModel)
                            }
                            .padding()
                            .padding(.top, -10)
                            
                            // Third row of products
                            HStack(spacing: 20) {
                                ProductItemView(product: Product(
                                    id: UUID(),
                                    name: "Apple",
                                    image: "apple",
                                    price: "$3.99",
                                    description: "1 kg",
                                    pdescription: "Fresh and juicy apples, rich in fiber and vitamin C."
                                ), favoritesViewModel: favoritesViewModel)
                                
                                ProductItemView(product: Product(
                                    id: UUID(),
                                    name: "Banana",
                                    image: "banana",
                                    price: "$2.49",
                                    description: "1 kg",
                                    pdescription: "Ripe bananas packed with potassium and natural sweetness."
                                ), favoritesViewModel: favoritesViewModel)
                            }
                            .padding()
                            .padding(.top, -10)
                        }
                    }
                }
                .navigationTitle("")
                
                
                
            }
            
            // Overlay for the filter view
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
}

#Preview {
    Fruits(favoritesViewModel: FavoritesViewModel.shared)
}
