import SwiftUI

struct CategoryCard<Destination: View>: View {
    var borderColor: Color
    var backgroundColor: Color
    var imageName: String
    var text: String
    var destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            RoundedRectangle(cornerRadius: 15)
                .stroke(borderColor, lineWidth: 0.8)
                .background(backgroundColor)
                .cornerRadius(15)
                .frame(width: 165, height: 175)
                .overlay(
                    VStack {
                        Image(imageName)
                            .resizable()
                            .frame(width: 110, height: 70)
                            .padding(.bottom, 15)
                        
                        Text(text)
                            .font(.customfont(.semibold, fontSize: 15))
                            .foregroundColor(.primaryText)
                    }
                )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct CategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryCard(borderColor: Color.green.opacity(0.9),
                         backgroundColor: Color.green.opacity(0.1),
                         imageName: "frash_fruits",
                         text: "Fresh Fruits & Vegetables",
                         destination: Text("Fresh Fruits & Vegetables Page")) // Example destination
            .previewLayout(.sizeThatFits)
            .padding()
        }
    }
}
