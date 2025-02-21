import SwiftUI

struct Bannertoptest: View {
    var body: some View {
        VStack {
            Text("TEST")
        }
        .padding(.bottom, -4)

        TabView {
            Image("1")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 185)
                .clipped()
            
            Image("2")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 185)
                .clipped()
            
            Image("3")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 185)
                .clipped()
        }
        .frame(height: 185) // Ensures correct height
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always)) // Enables snapping effect
    }
}

#Preview {
    Bannertoptest()
}
