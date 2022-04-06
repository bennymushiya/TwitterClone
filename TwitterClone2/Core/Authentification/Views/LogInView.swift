//
//  LogInView.swift
//  TwitterClone2
//
//  Created by benny mushiya on 09/03/2022.
//

import SwiftUI

struct LogInView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    // because this View is part of the same Environment as the contentView we have access the this viewModel that was initialised with the contentView.
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        // parent container
        VStack {
            
            //headerView
          AuthentificationHeaderView(title1: "Hello", title2: "Welcome back")
            
            VStack(spacing: 40) {
                
                CustomtTextField(imageName: "envelope", placeholderText: "email", text: $email)
                
                
                CustomtTextField(imageName: "lock", placeholderText: "password", isSecureField: true, text: $password)
                
                

            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack {
                
                Spacer()
                
                NavigationLink {
                    
                    Text("reset password view")
                    
                } label: {
                    
                    Text("forgot password")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(.top)
                        .padding(.trailing, 24)
                }
                
            }
            
            Button {
                
                viewModel.login(withEmail: email, password: password)
                
            } label: {
                
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()
                
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)

            
            Spacer()
            
            NavigationLink {
                
                RegistrationView()
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
            .foregroundColor(.blue)
            
            
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
