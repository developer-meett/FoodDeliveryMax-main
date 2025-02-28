import Foundation

class CartViewModel: ObservableObject {
    static let shared = CartViewModel()  // Singleton instance
    
    @Published var cartItems: [CartItem] = []
    
    func addToCart(product: Product, quantity: Int = 1) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[index].quantity += quantity
        } else {
            let newItem = CartItem(product: product, quantity: quantity)
            cartItems.append(newItem)
        }
        print("Added to cart: \(product.name) - Quantity: \(quantity)")
    }
    
    func decreaseQuantity(for product: Product) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            if cartItems[index].quantity > 1 {
                cartItems[index].quantity -= 1
            } else {
                removeFromCart(product: product)
            }
        }
    }
    
    func removeFromCart(product: Product) {
        cartItems.removeAll { $0.product.id == product.id }
        print("Removed from cart: \(product.name)")
    }
    
    func getTotalItems() -> Int {
        return cartItems.reduce(0) { $0 + $1.quantity }
    }
    
    func getTotalPrice() -> String {
        let total = cartItems.reduce(0.0) { sum, item in
            sum + (convertPriceToDouble(item.product.price) * Double(item.quantity))
        }
        return String(format: "$%.2f", total)
    }
    
    func getItemTotalPrice(for item: CartItem) -> String {
        let total = convertPriceToDouble(item.product.price) * Double(item.quantity)
        return String(format: "$%.2f", total)
    }

    private func convertPriceToDouble(_ price: String) -> Double {
        let cleanedPrice = price.replacingOccurrences(of: "$", with: "").trimmingCharacters(in: .whitespaces)
        return Double(cleanedPrice) ?? 0.0
    }
}
