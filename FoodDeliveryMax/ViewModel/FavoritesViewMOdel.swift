import SwiftUI

class FavoritesViewModel: ObservableObject {
    // This will hold the list of favorite products.
    @Published var favoriteProducts: [Product] = []
    
    // Singleton pattern to access the shared instance
    static let shared = FavoritesViewModel()
    
    private init() {} // Private initializer to ensure a single instance
    
    // Add product to favorites
    func addToFavorites(product: Product) {
        // Prevent duplicates
        if !favoriteProducts.contains(where: { $0.id == product.id }) {
            favoriteProducts.append(product)
        }
    }
    
    // Remove product from favorites
    func removeFromFavorites(product: Product) {
        favoriteProducts.removeAll { $0.id == product.id }
    }
}
