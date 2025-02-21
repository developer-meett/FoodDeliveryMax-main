import SwiftUI

struct Fruits: View {
    var favoritesViewModel: FavoritesViewModel
   
    var body: some View {
        NavigationStack{
            VStack {
              
                HStack {
                    Spacer()
                    Text("Fruits and vegetables")
                        .font(.customfont(.bold, fontSize: 20))
                        .padding(.leading, 20)
                    Spacer()
                    NavigationLink(destination: FilterView()) {
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
                        HStack(spacing: 20){
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
                  
                        }.padding()
                        
                        // Second row of products
                        HStack(spacing: 20){
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
                         
                        }.padding()
                            .padding(.top,-10)
                        
                        // Third row of products
                        HStack(spacing: 20){
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
    Fruits(favoritesViewModel: FavoritesViewModel.shared)
}
