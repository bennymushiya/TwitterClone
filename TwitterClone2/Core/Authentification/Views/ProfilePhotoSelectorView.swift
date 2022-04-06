//
//  ProfilePhotoSelectorView.swift
//  TwitterClone2
//
//  Created by benny mushiya on 10/03/2022.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        VStack {
            
            AuthentificationHeaderView(title1: "Create Your Account", title2: "Select a profile photo")
            
            
            Button {
                
                showImagePicker.toggle()
                
            } label: {
                
                if let profileImage = profileImage {
                    
                    profileImage
                        .resizable()
                        .clipShape(Circle())
                        .modifier(profileImageModifier())
                    
                } else {
                    
                    Image(systemName: "plus.bubble")
                        .resizable()
                        .renderingMode(.template)
                        .modifier(profileImageModifier())
                        
                }
            }
            
            // presents the image picker, then when it dismisses we call the load image function below and we collect that selected image
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                
                ImagePicker(image: $selectedImage)
            }
            .padding(.top, 44)
            
            if let selectedImage = selectedImage {
                
                Button {
                    
                    viewModel.uploadProfileImage(selectedImage)
                    
                } label: {
                    
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(.blue)
                        .clipShape(Capsule())
                        .padding()
                    
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            }

            
            Spacer()
        }
        .ignoresSafeArea()
        
    }
    
    // allows us to construct a swiftUI Image from a UIKit image.
    func loadImage() {
        
        // this is the image we get back from the user selection.
        guard let selectedImage = selectedImage else {return}
        
        // we get the selected image using the swiftUI image and pass it to the profileImage property
        profileImage = Image(uiImage: selectedImage)
        
    }
}


private struct profileImageModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(width: 180, height: 180)
            .scaledToFill()
            .foregroundColor(Color(.blue))
    }
    
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
