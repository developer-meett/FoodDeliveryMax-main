//
//  MyCarttt.swift
//  FoodDeliveryMax
//
//  Created by student on 01/03/25.
//

import SwiftUI

struct MyCarttt: View {
    var body: some View {
        VStack {
            Text("My Cartt")
                .font(.customfont(.bold, fontSize: 20))
                .padding()
            Divider()
            Mycart(product: Product(name: "bell_pepper_red", image: "bell_pepper_red", price: "$3.4", description: "bell pepper is good", pdescription: ""))
            Mycart(product: Product(name: "bell_pepper_red", image: "bell_pepper_red", price: "$3.4", description: "bell pepper is good", pdescription: ""))
            Mycart(product: Product(name: "bell_pepper_red", image: "bell_pepper_red", price: "$3.4", description: "bell pepper is good", pdescription: ""))
            Spacer()
        }
        
       
    }
        
       
    
}

#Preview {
    MyCarttt()
}
