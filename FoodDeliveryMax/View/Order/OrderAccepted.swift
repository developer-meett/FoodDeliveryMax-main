//
//  OrderAccepted.swift
//  FoodDeliveryMax
//
//  Created by student on 01/03/25.
//

import SwiftUI

struct OrderAccepted: View {
    @State private var isAnimating = false
    var body: some View {
        ZStack{
            Image("Orderbg")
                .resizable()
                .ignoresSafeArea(edges: .all)
            VStack {
                Image("order_accpeted")  // Use your image name here
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .opacity(isAnimating ? 1 : 0)  // Fades in
                    .scaleEffect(isAnimating ? 1 : 0.3)  // Grows from small to full size
                    .animation(.spring(response: 0.6, dampingFraction: 0.5), value: isAnimating)
                    .padding(.trailing, 40)
                    .padding(.bottom,60)
                
                Text("Your order has been \n         accepted!")
                    .font(.customfont(.semibold, fontSize: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.primaryText)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.easeInOut(duration: 1), value: isAnimating)
                
                Text("Your items has been placed and is on \n         its way to being processed")
                    .font(.customfont(.regular, fontSize: 17))
                    .foregroundColor(.gray)
                    .padding(.top, 5)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.easeInOut(duration: 1.5), value: isAnimating)
            }
            .padding(.bottom,80)
            .onAppear {
                isAnimating = true
            }
            
            VStack{
                Spacer()
                NavigationLink {
                    LogInView()
                } label: {
                    Text("Track order📍")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.white)
                        .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                        .background(Color.primaryApp)
                        .cornerRadius(20)
                        .padding()
                        
                }
                
                VStack{
                    Button(action: {
                        OrderTracking()
                    }) {
                        Text("Back to home")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.primaryText)
                            .padding(.bottom,60)
                            .padding(.trailing,10)
                        
                        
                    }
                    
                    
                }
                
            }
        }
    }
}


#Preview {
    NavigationStack{
        OrderAccepted()
    }
}
