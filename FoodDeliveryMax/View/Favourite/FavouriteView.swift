import SwiftUI

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var favoritesViewModel: FavoritesViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(favoritesViewModel.favoriteProducts, id: \.id) { product in
                    HStack {
                        Image(product.image)
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text(product.name)
                        Spacer()
                        Button(action: {
                            favoritesViewModel.removeFromFavorites(product: product) // Remove from favorites
                        }) {
                            Image(systemName: "trash") // Use a trash icon to remove
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Favorites")
                        .font(.customfont(.semibold, fontSize: 30)) // Use a custom font here
                  // Change the color if needed
                }
            }

            
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(favoritesViewModel: FavoritesViewModel.shared)
    }
}
