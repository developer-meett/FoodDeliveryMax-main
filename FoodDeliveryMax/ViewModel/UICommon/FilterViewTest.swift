//
//  FilterViewTest.swift
//  FoodDeliveryMax
//
//  Created by student on 21/02/25.
//

import SwiftUI

struct FilterViewTest: View {
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.black.opacity(0.2), lineWidth: 1.2)
                .frame(width: 20,height: 20)
            Text("All")
        }
    }
}

#Preview {
    FilterViewTest()
}
