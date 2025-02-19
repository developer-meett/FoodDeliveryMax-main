import SwiftUI

struct SignUpView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var mainVM = MainViewModel.shared;
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack{
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack{
                Image("color_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .padding(.bottom, 70)

                
                Text("Sign Up")
                    .font(.customfont(.semibold, fontSize: 26))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 10)
                
                Text("Enter your credentials to continue")
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 35)
                
                Text("Username")
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 7)
                
                TextField("Enter your username", text: $username)
                    .font(.customfont(.semibold, fontSize: 16))
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray.opacity(0.3))
                    .padding(.bottom, 26)
                
                Text("Email")
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 7)
                
                TextField("Enter your email", text: $email)
                    .font(.customfont(.semibold, fontSize: 16))
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray.opacity(0.3))
                    .padding(.bottom, 26)
                
                Text("Password")
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 7)
                
                TextField("Enter your password", text: $password)
                    .font(.customfont(.semibold, fontSize: 16))
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray.opacity(0.3))
                    .padding(.bottom, 26)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("By continuing you agree to our")
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor(.secondaryText)
                            .padding(.top, 5)
                        Text("Terms of service")
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor(.primaryApp)
                            .padding(.top, 5)
                            .padding(.leading, -3)
                    }
                    
                    HStack{
                        Text("and")
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor(.secondaryText)
                            .padding(.top, 1)
                        
                        Text("Privacy Policy.")
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor(.primaryApp)
                            .padding(.top, 1)
                            .padding(.leading, -3)
                    }
                    
                }
                .multilineTextAlignment(.leading)
                .padding(.leading, -45)
                .padding(.bottom, 20)
                
                Button{
                    mainVM.serviceCallSignUp()
                }label: {
                    Text("Sign Up")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 60)
                        .background(Color.primaryApp)
                        .cornerRadius(15)
                }.padding(.bottom, 20)
                
                HStack {
                    Text("Already have an account?")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.primaryText)
                    
                    NavigationLink {
                        LogInView()
                    } label: {
                        Text("LogIn")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.primaryApp)
                    }
                }
                
                
            }
            .padding(.horizontal, 25)
            .padding(.bottom, .bottomInsets)
            .padding(.top, 30)
            
            VStack{
                HStack{
                    NavigationLink {
                        SignInView()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding(.top, 60)
            .padding(.horizontal, 20)
        }
        
        .alert(isPresented: $mainVM.showError) {
            Alert(title: Text(Globs.AppName), message: Text( mainVM.errorMessage ), dismissButton: .default(Text("Ok")))
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack{
        SignUpView()
    }
}
