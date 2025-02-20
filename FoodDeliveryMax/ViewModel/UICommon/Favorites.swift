import Foundation

struct Favorite: Identifiable {
    var id: UUID
    var product: Product  // The product that is marked as a favorite

    // Initializer
    init(id: UUID = UUID(), product: Product) {
        self.id = id
        self.product = product
    }
}
