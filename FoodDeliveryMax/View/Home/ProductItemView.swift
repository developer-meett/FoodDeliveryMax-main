import SwiftUI

struct ProductItemView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    let product: Product  // Directly use the product object
    
    var body: some View {
        NavigationLink(
            destination: ProductDetailView(product: product)  
        ) {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black.opacity(0.2), lineWidth: 0.8)
                .frame(width: 165, height: 220)
                .overlay(
                    VStack(alignment: .leading) {
                        Image(product.image)
                            .resizable()
                            .frame(width: 110, height: 90)
                            .padding(.bottom, 15)
                        
                        Text(product.name)
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.primaryText)
                        
                        Text(product.description)
                            .font(.customfont(.semibold, fontSize: 10))
                            .foregroundColor(.gray)
                        
                        HStack {
                            Text(product.price)
                                .font(.customfont(.semibold, fontSize: 17))
                                .padding(.top)
                                .foregroundColor(.primaryText)
                            
                            Button(action: {}) {
                                Image("add")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding(7)
                            }
                            .background(Color.primaryApp)
                            .cornerRadius(10)
                            .padding(.top)
                            .padding(.leading, 50)
                        }
                    }
                )
        }
    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            let favoritesManager = FavoritesManager()  // Create an instance of FavoritesManager
            let product = Product(
                name: "Banana",
                image: "banana",
                price: "$4.99",
                description: "7 pcs",
                pdescription: "Banana is very good for health"
            )
            
            ProductItemView(product: product)
                .environmentObject(favoritesManager) // Inject the FavoritesManager
        }
    }
}
