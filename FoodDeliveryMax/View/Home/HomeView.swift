import SwiftUI

struct HomeView: View {
    @EnvironmentObject var cityViewModel: CityViewModel
    @EnvironmentObject var favoritesManager: FavoritesManager
   
    var body: some View {
        
        VStack{
            Image("color_logo")
                .resizable()
                .frame(width: 25, height: 30)
                .padding(.bottom, 3)
            
            HStack{
                NavigationLink{
                    CitySelectorView()
                }label: {
                    Image("location")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(width: 15, height: 17)
                    Text(cityViewModel.selectedCity)
                        .font(.customfont(.semibold, fontSize: 15))
                        .foregroundColor(.darkGray)
                }
            }
            
            SearchTextField(searchText: .constant(""), placeholder: "Search Store")
                .padding()
            ScrollView (.vertical, showsIndicators: false){
                Image("banner_top")
                    .resizable()
                    .ignoresSafeArea()
                    .frame(width: .infinity, height: 110)
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.bottom, 8)
                
                HStack{
                    Text("Exclusive Offer")
                        .font(.customfont(.semibold, fontSize: 19))
                        .foregroundColor(.primaryText)
                        .padding(.leading)
                    Spacer()
                    
                    Button(action: {}){
                        Text("See all")
                            .padding()
                            .foregroundColor(.primaryApp)
                            .font(.customfont(.semibold, fontSize: 14))
                            .padding(.leading)
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ProductItemView(product: Product(name: "Organic Bananas", image: "banana", price: "$1.99", description: "7 pcs",pdescription: "banana is very good for health"))
                            .padding(.leading)
                        
                        ProductItemView(product: Product(name: "Red Apple", image: "apple_red", price: "$2.99", description: "1 kg",pdescription: "banana is very good for health"))
                            .padding(.leading, 8)
                        
                        ProductItemView(product: Product(name: "Organic Bananas", image: "banana", price: "$4.99", description: "7 pcs",pdescription: "banana is very good for health"))
                            .padding(.leading, 8)
                            .padding(.leading, 8)
                    }
                }
                
                HStack{
                    Text("Best Selling")
                        .font(.customfont(.semibold, fontSize: 19))
                        .foregroundColor(.primaryText)
                        .padding(.leading)
                    Spacer()
                    
                    Button(action: {}){
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
                        ProductItemView(product: Product(name: "Bell Pepper Red", image: "bell_pepper_red", price: "$4.99", description: "1 kg",pdescription: "banana is very good for health"))
                            .padding(.leading)
                        
                        ProductItemView(product: Product(name: "Ginger", image: "ginger", price: "$3.99", description: "250 gm",pdescription: "banana is very good for health"))
                            .padding(.leading, 8)
                        
                        ProductItemView(product: Product(name: "Bell Pepper Red", image: "bell_pepper_red", price: "$2.99", description: "1 kg",pdescription: "banana is very good for health"))
                            .padding(.leading, 8)
                            .padding(.leading, 8)
                    }
                }
                
                HStack{
                    Text("Groceries")
                        .font(.customfont(.semibold, fontSize: 19))
                        .foregroundColor(.primaryText)
                        .padding(.leading)
                    Spacer()
                    
                    Button(action: {}){
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
                            HStack{
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
                            HStack{
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
                        ProductItemView(product: Product(name: "Beef Bone", image: "beef_bone", price: "$5.99", description: "1 kg",pdescription: "banana is very good for health"))
                            .padding(.leading)
                        
                        ProductItemView(product: Product(name: "Broiler Chicken", image: "broiler_chicken", price: "$2.69", description: "1 kg",pdescription: "banana is very good for health"))
                            .padding(.leading, 8)
                        
                        ProductItemView(product: Product(name: "Beef Bone", image: "beef_bone", price: "$5.99", description: "1 kg",pdescription: "banana is very good for health"))
                            .padding(.leading, 8)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
            .environmentObject(CityViewModel())
            .environmentObject(FavoritesManager())
       
        
    }
}
