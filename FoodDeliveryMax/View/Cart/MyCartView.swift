import SwiftUI

struct MyCartView: View {
    @ObservedObject var cartViewModel = CartViewModel.shared

    var body: some View {
        NavigationStack {
            VStack {
                // Title
                Text("My Cart")
                    .font(.customfont(.bold, fontSize: 20))
                    .padding()
                
                Divider()

                // Cart Items
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(cartViewModel.cartItems, id: \.id) { item in
                            Mycart(product: item.product)
                        }
                    }
                }

                Spacer()

                // Checkout Button
                VStack {
                    Divider()
                    NavigationLink(destination: OrderAccepted()) {  
                        HStack {
                            Spacer()
                            Text("Go to Checkout")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.white)
                            Spacer()

                            Text(cartViewModel.getTotalPrice())
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.white)
                                .padding(.horizontal)
                        }
                        .frame(height: 50)
                        .background(Color.primaryApp)
                        .cornerRadius(10)
                        .padding()
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    MyCartView(cartViewModel: CartViewModel())
}
