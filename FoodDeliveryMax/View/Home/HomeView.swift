import SwiftUI

import SwiftUI

struct HomeView: View {
    @State private var selectedCity: String = "Vadodara"  // Default city value
    @StateObject var favoritesViewModel = FavoritesViewModel.shared // Create an instance of FavoritesViewModel

    // Predefined list of cities
    let cities = ["New Delhi", "Mumbai", "Bangalore", "Chennai", "Kolkata", "Hyderabad",
                  "Pune", "Ahmedabad", "Surat", "Jaipur", "Chandigarh", "Lucknow", "Indore",
                  "Bhopal", "Kochi", "Coimbatore", "Visakhapatnam", "Nagpur", "Vadodara", "Patna"]

    var body: some View {
        NavigationStack {
            VStack {
                Image("color_logo")
                    .resizable()
                    .frame(width: 25, height: 30)
                    .padding(.bottom, 3)

                HStack {
                    Image("location")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(width: 15, height: 17)

                    // Picker for selecting city
                    Picker("Select City", selection: $selectedCity) {
                        ForEach(cities, id: \.self) { city in
                            Text(city).tag(city)
                                .font(.customfont(.semibold, fontSize: 15))
                                .foregroundColor(.primaryText)
                        }
                    }
                    .frame(width: 120)
                    .accentColor(.primaryText) // Adjust the width of the Picker if needed
                }

                SearchTextField(searchText: .constant(""), placeholder: "Search Store")
                    .padding()

                ScrollView(.vertical, showsIndicators: false) {
                    Image("banner_top")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(width: .infinity, height: 110)
                        .padding(.leading)
                        .padding(.trailing)
                        .padding(.bottom, 8)

                    HStack {
                        Text("Exclusive Offer")
                            .font(.customfont(.semibold, fontSize: 19))
                            .foregroundColor(.primaryText)
                            .padding(.leading)
                        Spacer()

                        Button(action: {}) {
                            Text("See all")
                                .padding()
                                .foregroundColor(.primaryApp)
                                .font(.customfont(.semibold, fontSize: 14))
                                .padding(.leading)
                        }
                    }

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Organic Bananas",
                                image: "banana",
                                price: "$1.99",
                                description: "7 pcs",
                                pdescription: "Organic bananas are rich in potassium and vitamin C."
                            ), favoritesViewModel: favoritesViewModel)
                            .padding(.leading)

                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Red Apple",
                                image: "apple_red",
                                price: "$2.99",
                                description: "1 kg",
                                pdescription: "Red apples are high in fiber and vitamin C."
                            ), favoritesViewModel: favoritesViewModel)
                            .padding(.leading, 8)

                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Organic Bananas",
                                image: "banana",
                                price: "$4.99",
                                description: "7 pcs",
                                pdescription: "Organic bananas are rich in potassium and vitamin C."
                            ), favoritesViewModel: favoritesViewModel)
                            .padding(.leading, 8)
                        }
                    }

                    HStack {
                        Text("Best Selling")
                            .font(.customfont(.semibold, fontSize: 19))
                            .foregroundColor(.primaryText)
                            .padding(.leading)
                        Spacer()

                        Button(action: {}) {
                            Text("See all")
                                .padding()
                                .foregroundColor(.primaryApp)
                                .font(.customfont(.semibold, fontSize: 14))
                                .padding(.leading)
                        }
                    }
                    .padding(.top, 5)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Bell Pepper Red",
                                image: "bell_pepper_red",
                                price: "$4.99",
                                description: "1 kg",
                                pdescription: "Red bell peppers are packed with vitamins A and C."
                            ), favoritesViewModel: favoritesViewModel)
                            .padding(.leading)

                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Ginger",
                                image: "ginger",
                                price: "$3.99",
                                description: "250 gm",
                                pdescription: "Ginger is known for its anti-inflammatory properties."
                            ), favoritesViewModel: favoritesViewModel)
                            .padding(.leading, 8)

                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Bell Pepper Red",
                                image: "bell_pepper_red",
                                price: "$2.99",
                                description: "1 kg",
                                pdescription: "Red bell peppers are packed with vitamins A and C."
                            ), favoritesViewModel: favoritesViewModel)
                            .padding(.leading, 8)
                        }
                    }

                    HStack {
                        Text("Groceries")
                            .font(.customfont(.semibold, fontSize: 19))
                            .foregroundColor(.primaryText)
                            .padding(.leading)
                        Spacer()

                        Button(action: {}) {
                            Text("See all")
                                .padding()
                                .foregroundColor(.primaryApp)
                                .font(.customfont(.semibold, fontSize: 14))
                                .padding(.leading)
                        }
                    }
                    .padding(.top, 5)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Button(action: {}) {
                                HStack {
                                    Image("pulses")
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                        .padding(.leading, 15)
                                        .padding(.top, 15)
                                        .padding(.bottom, 15)

                                    Text("Pulses")
                                        .font(.customfont(.semibold, fontSize: 19))
                                        .foregroundColor(.primaryText)
                                        .padding(.trailing, 70)
                                }
                            }
                            .background(Color(hex: "#fbe1cd"))
                            .cornerRadius(10)
                            .padding(.leading)

                            Button(action: {}) {
                                HStack {
                                    Image("rice")
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                        .padding(.leading, 15)
                                        .padding(.top, 15)
                                        .padding(.bottom, 15)

                                    Text("Rice")
                                        .font(.customfont(.semibold, fontSize: 19))
                                        .foregroundColor(.primaryText)
                                        .padding(.trailing, 85)
                                }
                            }
                            .background(Color(hex: "#dafbd9"))
                            .cornerRadius(10)
                            .padding(.leading)
                        }
                    }
                    .padding(.bottom, 16)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Beef Bone",
                                image: "beef_bone",
                                price: "$5.99",
                                description: "1 kg",
                                pdescription: "Beef bones are rich in collagen and minerals."
                            ), favoritesViewModel: favoritesViewModel)
                            .padding(.leading, 8)

                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Broiler Chicken",
                                image: "broiler_chicken",
                                price: "$2.69",
                                description: "1 kg",
                                pdescription: "Broiler chicken is a good source of protein."
                            ), favoritesViewModel: favoritesViewModel)
                            .padding(.leading, 8)

                            ProductItemView(product: Product(
                                id: UUID(),
                                name: "Beef Bone",
                                image: "beef_bone",
                                price: "$5.99",
                                description: "1 kg",
                                pdescription: "Beef bones are rich in collagen and minerals."
                            ), favoritesViewModel: favoritesViewModel)
                            .padding(.leading, 8)
                        }
                    }
                }
            }
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView()
                 // Ensure the CityViewModel is injected
        }
    }
}
