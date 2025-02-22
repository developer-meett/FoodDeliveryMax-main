import SwiftUI

struct FilterSection: View {
    let title: String
    let options: [String]
    @Binding var selection: Set<String>
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .bold()
            
            ForEach(options, id: \.self) { option in
                HStack {
                    Image(selection.contains(option) ? "checkbox_check" : "checkbox") // Use your checkbox images
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
