import SwiftUI

import SwiftUI

struct ProductItemView: View {
    let product: Product
    @State private var isFavorited: Bool = false
    var favoritesViewModel: FavoritesViewModel

    var body: some View {
        NavigationLink(destination: ProductDetailView(product: product)) {
            ZStack(alignment: .topTrailing) {
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
                                    Image("add") // Replace with your "add to cart" image or icon
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .padding(7)
                                        
                                }
                                .background(Color.primaryApp)
                                .cornerRadius(10)
                                .padding(.top)
                                .padding(.leading, 45)
                                
                            }
                        }
                    )
                
                // Heart icon for favorites in the top-right corner
                Button(action: {
                    isFavorited.toggle() // Toggle favorite state
                    if isFavorited {
                        favoritesViewModel.addToFavorites(product: product) // Add to favorites
                    } else {
                        favoritesViewModel.removeFromFavorites(product: product) // Remove from favorites
                    }
                }) {
                    Image(isFavorited ? "favorite" : "fav") // Change heart icon based on state
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.red)
                        .padding(8)
                }
            }
            .padding()
        }
        .buttonStyle(PlainButtonStyle()) // Remove default styling of NavigationLink
    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product: Product(id: UUID(), name: "Banana", image: "banana", price: "$29.99", description: "7 pcs", pdescription: "banana is good fruit"), favoritesViewModel: FavoritesViewModel.shared)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
