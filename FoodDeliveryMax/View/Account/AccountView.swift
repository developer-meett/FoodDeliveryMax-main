//
//  AccountView.swift
//  FoodDeliveryMax
//
//  Created by Teacher on 07/02/25.
//

import SwiftUI

struct AccountView: View {
  
    var body: some View {
        VStack(alignment: .leading,spacing: 2){
            HStack{
                Image("profile")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .scaledToFit()
                    .clipShape(.circle)
                    .padding(.bottom,20)
                
                VStack{
                    Text("shreyas suresh")
                        .font(.customfont(.semibold, fontSize: 19))
                        .padding(.bottom,25)
                    Text("shreyas_suresh123gmail.com")
                        .font(.customfont(.regular, fontSize: 10))
                        .foregroundColor(.gray)
                        .padding(.top,-29)
                }
                Spacer()
                
            }
            AccountOption(image: "a_about", text: "About", destination: AnyView(OrdersView()))
            Divider()
            AccountOption(image: "a_delivery_address", text: "Delivery Address", destination: AnyView(OrdersView()))
            Divider()
            AccountOption(image: "a_help", text: "Help", destination: AnyView(OrdersView()))
            Divider()
            AccountOption(image: "a_my_detail", text: "My Detail", destination: AnyView(OrdersView()))
            Divider()
            AccountOption(image: "a_noitification", text: "Notification", destination: AnyView(OrdersView()))
            Divider()
            AccountOption(image: "a_order", text: "Order", destination: AnyView(OrdersView()))
            Divider()
            AccountOption(image: "a_promocode", text: "Promocode", destination: AnyView(OrdersView()))
            Divider()
            AccountOption(image: "account_tab", text: "Account", destination: AnyView(OrdersView()))
            Spacer()
                
            NavigationLink {
                LogInView()  // Destination view
                            } label: {
                                HStack {
                                    // Add your image here
                                    Image("logout")  // Example system image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)  // Adjust the size of the image
                                        .foregroundColor(.primaryApp)
                                    Spacer()

                                    // Text for the button
                                    Text("Logout")
                                        .font(.customfont(.semibold, fontSize: 20)) // Replace with your font
                                        .foregroundColor(.primaryApp)  // Make sure .primaryApp is a valid color
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity, maxHeight: 30)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(20)  // Rounded corners
                            }
        }
        .padding()
        
    }
}
      

#Preview {
    NavigationStack{
        AccountView()
    }
}
