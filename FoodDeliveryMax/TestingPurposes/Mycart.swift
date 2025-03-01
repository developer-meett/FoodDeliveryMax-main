import SwiftUI

struct Mycart: View {
    var product: Product
    @State private var quantity: Int = 1  // State variable to track quantity

    var body: some View {
       
        HStack {
            Image(product.image)
                .resizable()
                .frame(width: 70, height: 70)
                .padding()
                
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.customfont(.semibold, fontSize: 17))
                Text(product.description)
                    .font(.customfont(.regular, fontSize: 13))
                    .foregroundColor(Color.secondaryText)

                HStack {
                    // Minus button
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.secondaryText.opacity(0.5))
                        .frame(width: 35, height: 35)
                        .overlay(
                            Button(action: {
                                if quantity > 1 {
                                    quantity -= 1
                                }
                            }) {
                                Image("minus")
                                    .resizable()
                                    .frame(width: 10, height: 10)
                                    .scaledToFit()
                                    .padding()
                            }
                        )

                    // Quantity text
                    Text("\(quantity)")
                        .font(.customfont(.semibold, fontSize: 16))
                        .frame(width: 40)  // Ensures spacing remains consistent

                    // Add button
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.secondaryText.opacity(0.5))
                        .frame(width: 35, height: 35)
                        .overlay(
                            Button(action: {
                                quantity += 1
                            }) {
                                Image("add_green")
                                    .resizable()
                                    .frame(width: 18, height: 18)
                                    .scaledToFit()
                                    .padding()
                            }
                        )

                    // Price
                    Text(product.price*Double(quantity)).compositingGroup())
                        .font(.customfont(.semibold, fontSize: 16))
                        .padding(.leading, 70)
                        .padding(.bottom, -6)
                }
            }

            Spacer()

            // Close button (❌)
            Button(action: {
                // Functionality not added as per your request
            }) {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
            }
            .padding(.trailing, 10) // Keeps spacing consistent
        }
        Divider()
    }
}

#Preview {
    Mycart(product: Product(id: UUID(), name: "Bell Pepper", image: "bell_pepper_red", price: "$7.8", description: "7 pcs, price", pdescription: "jsgfkjsfksd"))
}
