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


struct Product: Identifiable {
    var id: UUID  // Unique identifier for each product
    var name: String
    var image: String
    var price: String
    var description: String
    var pdescription : String

    // Initialize the product
    init(id: UUID = UUID(), name: String, image: String, price: String, description: String ,pdescription: String) {
        self.id = id
        self.name = name
        self.image = image
        self.price = price
        self.description = description
        self.pdescription = pdescription
    }
}
