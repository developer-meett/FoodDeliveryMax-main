//
//  AccountOption.swift
//  FoodDeliveryMax
//
//  Created by student on 12/02/25.
//

import SwiftUI

struct AccountOption: View {
    let image: String
    let text: String
    let destination: AnyView // You can pass a destination view wrapped in AnyView
    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 23, height: 23)
                
                Text(text)
                    .font(.customfont(.semibold, fontSize: 15))
                    .foregroundColor(.black)
                    .padding(.leading)
                Spacer()
            }
            .padding(.all)
        }
    }
}


#Preview {
    AccountOption(image: "a_order", text: "Orders" , destination: AnyView(Text("Orders")) )
}
