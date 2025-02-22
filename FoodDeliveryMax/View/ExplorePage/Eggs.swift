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
    Eggs(favoritesViewModel: FavoritesViewModel.shared)
}
