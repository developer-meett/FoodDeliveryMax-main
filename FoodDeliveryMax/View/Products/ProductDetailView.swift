import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager // Inject the favorites manager
    @State private var quantity: Int = 1
    @State private var isFavorited: Bool = false // Track if the product is in favorites

    // Receive the entire product object
    var product: Product

    var body: some View {
        ScrollView {
            VStack {
                // Product Image with Blur Effect Inside a Rectangle
                ZStack {
                    Rectangle()
                        .fill(Color.gray.opacity(0.1))
                        .frame(width: 350, height: 350)
                        .cornerRadius(20)
                        .blur(radius: 10) // Apply the blur effect

                    Image(product.image) // Use dynamic product image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 350)
                        .cornerRadius(20)
                        .padding()
                }

                // Product Info
                VStack {
                    HStack {
                        Text(product.name) // Use dynamic product name
                            .font(.customfont(.bold, fontSize: 30))
                       
                        Spacer()
                        
                        Button(action: {
                            // Toggle favorite state
                            if isFavorited {
                                favoritesManager.removeFromFavorites(product: product) // Remove from favorites
                            } else {
                                favoritesManager.addToFavorites(product: product) // Add to favorites
                            }
                            isFavorited.toggle() // Toggle the state
                        }) {
                            Image(systemName: isFavorited ? "heart.fill" : "heart") // Change heart icon based on state
                                .font(.title)
                                .foregroundColor(isFavorited ? .red : .gray) // Change color based on state
                        }
                    }
                    
                    Text(product.description) // You can customize this or use another property
                        .font(.customfont(.semibold, fontSize: 17))
                        .foregroundColor(.gray)

                    HStack {
                        HStack {
                            Button(action: {
                                if quantity > 1 { quantity -= 1 }
                            }) {
                                Text("-")
                                    .font(.title)
                            }
                            Text("\(quantity)")
                                .font(.customfont(.semibold, fontSize: 24))
                            Button(action: {
                                quantity += 1
                            }) {
                                Text("+")
                                    .font(.title)
                                    .foregroundColor(.green)
                                    .padding(.bottom, 2)
                            }
                        }
                        Spacer()
                        Text(product.price) // Use dynamic price from product
                            .font(.customfont(.semibold, fontSize: 27))
                            .fontWeight(.bold)
                    }
                }
                .padding(.horizontal, 24) // Match horizontal padding

                // Product Details Section
                VStack {
                    Divider()
                    HStack {
                        Text("Product Detail")
                            .font(.customfont(.semibold, fontSize: 17))
                        Spacer()
                        Image(systemName: "chevron.down")
                    }
                    Text(product.pdescription) // Use dynamic product pdescription
                        .font(.customfont(.regular, fontSize: 17))
                        .foregroundColor(.gray)
                    Divider()

                    HStack {
                        Text("Nutritions")
                            .font(.customfont(.semibold, fontSize: 17))
                        Spacer()
                        Text("100gr") // You can make this dynamic if needed
                            .foregroundColor(.gray)
                        Image(systemName: "chevron.right")
                    }
                    Divider()

                    HStack {
                        Text("Review")
                            .font(.customfont(.semibold, fontSize: 17))
                        Spacer()
                        HStack(spacing: 2) {
                            ForEach(0..<5) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                        }
                        Image(systemName: "chevron.right")
                    }
                }
                .padding(.horizontal, 24) // Match horizontal padding
                .padding(.vertical, 25) // Adjusted vertical padding

                // Add to Basket Button
                Button(action: {}) {
                    Text("Add To Basket")
                        .font(.customfont(.bold, fontSize: 20))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.primaryApp)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 20) // Match horizontal padding
                .padding(.bottom, 5) // Adjusted bottom padding
            }
            .cornerRadius(20)
            .padding(.horizontal, 20) // Match horizontal padding
            .padding(.bottom, 20) // Adjusted bottom padding
        }
        .padding(.top, 50) // Match top padding
        .ignoresSafeArea(.all)
        .onAppear {
            // Check if the product is already favorited
            isFavorited = favoritesManager.favorites.contains { $0.id == product.id }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            let favoritesManager = FavoritesManager()
            ProductDetailView(
                product: Product(
                    id: UUID(),
                    name: "Naturel Red Apple",
                    image: "apple_red", // Image name should be in your assets
                    price: "$4.99",
                    description: "7 pcs", // This will be displayed in the description field
                    pdescription: "Banana is very good for health" // This will be displayed in the product detail
                )
            )
            .environmentObject(FavoritesManager()) // Inject the FavoritesManager
        }
    }
}
