import SwiftUI

struct ProductDetailView: View {
    @State private var quantity: Int = 1
    @ObservedObject var cartViewModel = CartViewModel.shared // Use Singleton
    var product: Product
   
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.gray.opacity(0.1))
                        .frame(width: 350, height: 350)
                        .cornerRadius(20)
                        .blur(radius: 10)

                    Image(product.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 350)
                        .cornerRadius(20)
                        .padding()
                }

                VStack(alignment: .leading) {
                    Text(product.name)
                        .font(.customfont(.bold, fontSize: 30))

                    Text(product.description)
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
                        Text(product.price)
                            .font(.customfont(.semibold, fontSize: 27))
                            .fontWeight(.bold)
                    }
                }
                .padding(.horizontal, 24)
                
                VStack {
                    Divider()
                    HStack {
                        Text("Product Detail")
                            .font(.customfont(.semibold, fontSize: 17))
                        Spacer()
                        Image(systemName: "chevron.down")
                    }
                    Text(product.pdescription)
                        .font(.customfont(.regular, fontSize: 17))
                        .foregroundColor(.gray)
                    Divider()

                    HStack {
                        Text("Nutritions")
                            .font(.customfont(.semibold, fontSize: 17))
                        Spacer()
                        Text("100gr")
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
                .padding(.horizontal, 24)
                .padding(.vertical, 25)

                Button(action: {
                    print("🛒 Button tapped for: \(product.name)")
                                  cartViewModel.addToCart(product: product, quantity: quantity)
                              }) {
                                  Text("Add To Basket")
                                      .font(.customfont(.bold, fontSize: 20))
                                      .foregroundColor(.white)
                                      .frame(maxWidth: .infinity)
                                      .padding()
                                      .background(Color.primaryApp)
                                      .cornerRadius(10)
                              }
                              .padding(.horizontal, 20)
                              .padding(.bottom, 5)
                          }
                          .cornerRadius(20)
                          .padding(.horizontal, 20)
                          .padding(.bottom, 20)
                      }
                      .padding(.top, 50)
                      .ignoresSafeArea(.all)
                  }
              }
struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProductDetailView(
                cartViewModel: CartViewModel(), product: Product(
                    id: UUID(),
                    name: "Naturel Red Apple",
                    image: "apple_red", // Image name should be in your assets
                    price: "$4.99",
                    description: "7 pcs", // This will be displayed in the description field
                    pdescription: "Banana is very good for health" // This will be displayed in the product detail
                )
            )
        }
    }
}
