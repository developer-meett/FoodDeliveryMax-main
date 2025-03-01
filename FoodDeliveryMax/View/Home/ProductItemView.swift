import SwiftUI

struct ProductItemView: View {
    let product: Product
    @State private var isFavorited: Bool = false
    var favoritesViewModel: FavoritesViewModel
    @ObservedObject var cartViewModel: CartViewModel

    var body: some View {
        ZStack(alignment: .topTrailing) {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black.opacity(0.2), lineWidth: 0.6)
                .frame(width: 160, height: 220)
                .overlay(
                    VStack(alignment: .leading) {
                        NavigationLink(destination: ProductDetailView(cartViewModel: cartViewModel, product: product)) {
                            VStack {
                                Image(product.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 110, height: 100)
                                    .padding(.bottom, 15)

                                Text(product.name)
                                    .font(.customfont(.semibold, fontSize: 16))
                                    .foregroundColor(.primaryText)
                            }
                        }

                        Text(product.description)
                            .font(.customfont(.semibold, fontSize: 10))
                            .foregroundColor(.gray)

                        HStack {
                            Text(product.price)
                                .font(.customfont(.semibold, fontSize: 17))
                                .padding(.top)
                                .foregroundColor(.primaryText)

                            Button(action: {
                                print("Adding to cart: \(product.name)")  
                                cartViewModel.addToCart(product: product)
                            }) {
                                Image("add")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding(7)
                            }
                            .background(Color.primaryApp)
                            .cornerRadius(10)
                            .padding(.top)
                            .padding(.leading, 40)
                        }
                    }
                )

            // Heart icon for favorites in the top-right corner
            Button(action: {
                isFavorited.toggle()
                if isFavorited {
                    favoritesViewModel.addToFavorites(product: product)
                    print("Added to favorites: \(product.name)")
                } else {
                    favoritesViewModel.removeFromFavorites(product: product)
                    print("Removed from favorites: \(product.name)")
                }
            }) {
                Image(isFavorited ? "favorite" : "fav")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.red)
                    .padding(8)
            }
        }
    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(
            product: Product(id: UUID(), name: "Banana", image: "banana", price: "$29.99", description: "7 pcs", pdescription: "banana is good fruit"),
            favoritesViewModel: FavoritesViewModel.shared,
            cartViewModel: CartViewModel()
        )
        .previewLayout(.sizeThatFits)
    }
}
