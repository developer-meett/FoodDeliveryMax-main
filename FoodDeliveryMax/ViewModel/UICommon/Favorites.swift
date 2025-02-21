import Foundation

struct Favorite: Identifiable {
    var id: UUID
    var product: Product  

    // Initializer
    init(id: UUID = UUID(), product: Product) {
        self.id = id
        self.product = product
    }
}
