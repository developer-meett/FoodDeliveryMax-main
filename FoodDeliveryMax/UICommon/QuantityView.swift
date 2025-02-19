import SwiftUI

struct QuantityView: View {
    @State private var quantity: Int = 0  // State variable to store the quantity

    var body: some View {
        VStack {
            HStack {
                // Plus/Add button to increase quantity
                Button(action: {
                    quantity += 1  // Increment the quantity when button is tapped
                }) {
                    Image(systemName: "plus.circle.fill") // Add icon (can be any custom image or system icon)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.green)
                        .padding(7)
                }
                
                // Display the current quantity
                Text("Quantity: \(quantity)")
                    .font(.headline)
                    .padding(.leading, 10)
            }
        }
    }
}

struct QuantityView_Previews: PreviewProvider {
    static var previews: some View {
        QuantityView()
    }
}
