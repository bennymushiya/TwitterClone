//
//  NewTweetView.swift
//  TwitterClone2
//
//  Created by benny mushiya on 09/03/2022.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    
    @State private var caption = ""
    
    // it recognises the presentation state of the application, so each time a view is presented this variable recognises that and adds functionality to that view if we wish e.g cancel the view.
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = UploadTweetViewModel()
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Button {
                    
                    presentationMode.wrappedValue.dismiss()

                    
                } label: {
                    
                    Text("cancel")
                        .foregroundColor(.blue)
                }
                
                Spacer()
                
                Button {
                    
                    viewModel.uploadTweet(withCaption: caption)
                    
                } label: {
                    
                    Text("tweet")
                        .bold()
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                }

            }
            .padding()
            
            HStack(alignment: .top) {
                
                if let user = authViewModel.currentUser {
                    
                    KFImage(URL(string: user.profileImage))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                    
                }
                
                
                TextArea("whats happening", text: $caption)
            }
            .padding()
            
            
        }
        
        // if something changes in our view, this lets us know so we can implement some code. so as soon as we upload the tweet we ask this view to dismiss itself.
        .onReceive(viewModel.$didUploadTweet) { success in
            
            if success {
                
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        
        NewTweetView()
    }
}
