//
//  File.swift
//  FoodDeliveryMax
//
//  Created by student on 11/02/25.
//


  NavigationLink{
                        SignInView()
                    }label: {
                        Text("Get Started")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .frame(minWidth: 0, maxWidth: 330, minHeight: 0, maxHeight: 60)
                            .background(Color.primaryApp)
                            .cornerRadius(15)
                    }