import SwiftUI

struct CategoryCard: View {
    var borderColor: Color
    var backgroundColor: Color
    var imageName: String
    var text: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .stroke(borderColor, lineWidth: 0.8)
            .background(backgroundColor)
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
}

struct CategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCard(borderColor: Color.green.opacity(0.9),
                     backgroundColor: Color.green.opacity(0.1),
                     imageName: "frash_fruits",
                     text: "Fresh Fruits & Vegetables")
        .previewLayout(.sizeThatFits)
        .padding()
        .environmentObject(FavoritesManager())
    }

}
