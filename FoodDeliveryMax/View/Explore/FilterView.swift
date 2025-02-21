import SwiftUI

struct FilterView: View {
    @State private var selectedCategories: Set<String> = []
    @State private var selectedBrands: Set<String> = []
    
    let categories = ["Eggs", "Noodles & Pasta", "Chips & Crisps", "Fast Food"]
    let brands = ["Individual Collection", "Cocola", "Ifad", "Kazi Farmas"]
    
    var body: some View {
        VStack(alignment: .leading) {
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
            
            Button(action: {}) {
                Text("Apply Filter")
                    .font(.customfont(.bold, fontSize: 20))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.primaryApp)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
            }
        }
        .background(Color.gray.opacity(0.1))
        .cornerRadius(20)
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct FilterSection: View {
    let title: String
    let options: [String]
    @Binding var selection: Set<String>
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .bold()
            
            ForEach(options, id: \..self) { option in
                HStack {
                    Image(selection.contains(option) ? "checkbox_check" : "checkbox")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Text(option)
                        .foregroundColor(.primary)
                    
                    Spacer()
                }
                .padding(.vertical, 5)
                .onTapGesture {
                    if selection.contains(option) {
                        selection.remove(option)
                    } else {
                        selection.insert(option)
                    }
                }
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
