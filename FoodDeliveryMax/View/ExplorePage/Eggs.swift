import SwiftUI

struct Eggs: View {
    var favoritesViewModel: FavoritesViewModel
    @State private var showFilterView = false
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    HStack {
                        Spacer()
                        Text("Eggs and Meat")
                            .font(.customfont(.bold, fontSize: 20))
                            .padding(.leading, 20)
                        Spacer()
                        Button(action: {
                            withAnimation(.spring()) {
                                showFilterView.toggle()
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
                                    name: "Eggs(red)",
                                    image: "egg_chicken_red",
                                    price: "$5.99",
                                    description: "1 kg",
                                    pdescription: "Beef bones are rich in collagen and minerals."
                                ), favoritesViewModel: favoritesViewModel)
                                
                                ProductItemView(product: Product(
                                    id: UUID(),
                                    name: "Eggs(White)",
                                    image: "egg_chicken_white",
                                    price: "$2.69",
                                    description: "1 kg",
                                    pdescription: "Broiler chicken is a good source of protein."
                                ), favoritesViewModel: favoritesViewModel)
                            }
                            .padding()
                        }
                    }
                }
                .navigationTitle("")
            }
            
            // Animated Filter View
            if showFilterView {
                FilterView()
                    .frame(height: 700)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .offset(y: showFilterView ? 0 : UIScreen.main.bounds.height)
                    .animation(.spring(), value: showFilterView)
                    .transition(.move(edge: .bottom))
                    .zIndex(1) // Bring to front
            }
        }
    }
}

#Preview {
    Eggs(favoritesViewModel: FavoritesViewModel.shared)
}
