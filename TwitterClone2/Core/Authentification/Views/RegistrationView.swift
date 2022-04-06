//
//  RegistrationView.swift
//  TwitterClone2
//
//  Created by benny mushiya on 09/03/2022.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        VStack {
            
            // were gonna activate this navigationlink based on what happens in our ViewModel. so when we authenticate a user and store there information in the database this navigation link becomes active and takes us to photoView
            NavigationLink(destination: ProfilePhotoSelectorView(), isActive: $viewModel.didAuthenticateUser, label: { })
            
            AuthentificationHeaderView(title1: "Get Started", title2: "Create Your Account")
            
            
            VStack(spacing: 40) {
                
                CustomtTextField(imageName: "envelope", placeholderText: "Email", text: $email)
                
                CustomtTextField(imageName: "person", placeholderText: "username", text: $username)
                
                CustomtTextField(imageName: "person", placeholderText: "fullname", text: $fullname)
                
                CustomtTextField(imageName: "lock", placeholderText: "password", isSecureField: true, text: $password)
                
                
            }
            .padding(32)
            
            Button {
                
                viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
                
            } label: {
                
                Text("Sign up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()
                
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)

            
            Spacer()
            
            Button {
                
                presentationMode.wrappedValue.dismiss()

            } label: {
                
                HStack {
                    
                    Text("dont have an account ")
                        .font(.footnote)
                    
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            

            
        }
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
