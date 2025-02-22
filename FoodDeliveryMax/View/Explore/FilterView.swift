import SwiftUI

struct FilterView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedCategories: Set<String> = []
    @State private var selectedBrands: Set<String> = []
    
    let categories = ["Eggs", "Noodles & Pasta", "Chips & Crisps", "Fast Food"]
    let brands = ["Individual Collection", "Cocola", "Ifad", "Kazi Farmas"]
    
    var onClose: (() -> Void)? // Closure to handle the close action
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    onClose?() // Call the close action
                }) {
                    Image(systemName: "xmark") // Use a system icon for the close button
                        .font(.title)
                        .foregroundColor(.black)
                }
                Spacer()
            }
            .padding()

            Text("Filters")
                .font(.customfont(.bold, fontSize: 20))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 10)
            
            Divider()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    FilterSection(title: "Categories", options: categories, selection: $selectedCategories)
                    FilterSection(title: "Brand", options: brands, selection: $selectedBrands)
                }
                .padding()
            }
            
            Button(action: {
                // Handle apply filter action here
                presentationMode.wrappedValue.dismiss() // Dismiss the filter view
            }) {
                Text("Apply Filter")
                    .font(.customfont(.bold, fontSize: 20))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.primaryApp)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
                    .padding(.bottom,40)
            }
        }
        .background(Color.primaryApp.opacity(0.1))
        .cornerRadius(20)
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(onClose: {})
    }
}
