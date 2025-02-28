import Foundation

struct CartItem: Identifiable {
    let id = UUID()  // Ensures each CartItem is uniquely identifiable
    let product: Product
    var quantity: Int
}
