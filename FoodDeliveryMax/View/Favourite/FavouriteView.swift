import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager // Inject FavoritesManager
  
    var body: some View {
        NavigationView {
            VStack {
                if favoritesManager.favorites.isEmpty {
                    Text("No favorites added yet!")
                        .font(.title)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    // Fix: Change 'Product' to 'product' and use 'product.name' for image
                    List(favoritesManager.favorites) { product in
                        HStack {
                            Image(product.image)  // Access 'name' property
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)

                            VStack(alignment: .leading) {
                                Text(product.name)
                                    .font(.headline)
                                Text(product.price)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }

                            Spacer()
                            
                            Button(action: {
                                favoritesManager.removeFromFavorites(product: product)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
            }
            .navigationBarTitle("Favorites", displayMode: .inline)
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(FavoritesManager()) // Inject FavoritesManager here as well
    }
}

