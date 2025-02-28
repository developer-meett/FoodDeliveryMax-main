import SwiftUI

struct MyCartView: View {
    @ObservedObject var cartViewModel = CartViewModel.shared

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(cartViewModel.cartItems, id: \.id) { item in
                        HStack {
                            // Product Image
                            Image(item.product.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)

                            // Product Details
                            VStack(alignment: .leading, spacing: 5) {
                                Text(item.product.name)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                
                                // ✅ Check if `weight` exists, otherwise show "N/A"
                                Text("\(item.product.description), Price")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }

                            Spacer()
                            
                            // Quantity Controls
                            HStack {
                                Button(action: {
                                    cartViewModel.decreaseQuantity(for: item.product)
                                }) {
                                    Image(systemName: "minus")
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                                }
                                
                                Text("\(item.quantity)")
                                    .font(.headline)
                                    .frame(width: 30)
                                
                                Button(action: {
                                    cartViewModel.addToCart(product: item.product)
                                }) {
                                    Image(systemName: "plus")
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                                }
                            }

                            // ✅ Fix: Use Correct Price Conversion Function
                            let itemTotal = cartViewModel.getItemTotalPrice(for: item)

                            Text(itemTotal)
                                .font(.headline)
                                .foregroundColor(.primary)

                            // Remove Button
                            Button(action: {
                                cartViewModel.removeFromCart(product: item.product)
                            }) {
                                Image(systemName: "xmark")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .listStyle(PlainListStyle())

                // Bottom Checkout Bar
                VStack {
                    Divider()
                    HStack {
                        Spacer()
                        Text("Go to Checkout")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()

                        Text(cartViewModel.getTotalPrice())
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                    .frame(height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
                    .padding()
                }
            }
            .navigationTitle("My Cart")
        }
    }
}
extension CartViewModel {
    static func mock() -> CartViewModel {
        let mockCart = CartViewModel()
        
        let sampleProducts = [
            Product(name: "Apple", image: "apple_image", price: "$1.99", description: "Fresh Apple", pdescription: "Red Delicious Apple"),
            Product(name: "Banana", image: "banana_image", price: "$0.99", description: "Organic Banana", pdescription: "Yellow Cavendish Banana"),
            Product(name: "Milk", image: "milk_image", price: "$3.50", description: "Dairy Milk", pdescription: "Whole Milk 1L")
        ]
        
        for product in sampleProducts {
            mockCart.addToCart(product: product, quantity: Int.random(in: 1...3))
        }
        
        return mockCart
    }
}
#Preview {
    MyCartView(cartViewModel: CartViewModel.mock())
}
