import SwiftUI

class FavoritesManager: ObservableObject {
    @Published var favorites: [Product] = []  // Store Product objects
    
    // Add product to favorites
    func addToFavorites(product: Product) {
        if !favorites.contains(where: { $0.id == product.id }) {
            favorites.append(product)
        }
    }

    // Remove product from favorites
    func removeFromFavorites(product: Product) {
        favorites.removeAll { $0.id == product.id }
    }
}


