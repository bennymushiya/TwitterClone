//
//  TweetRowView.swift
//  TwitterClone2
//
//  Created by benny mushiya on 08/03/2022.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    
    let tweets: Tweet
    
    var body: some View {
       
        // parent
        VStack(alignment: .leading) {
            
            if let user = tweets.user {
                
                // profile image + user info + tweet
                HStack(alignment: .top, spacing: 12) {
                    
                    KFImage(URL(string: user.profileImage))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                    
                    
                    // user info and tweet caption
                    VStack(alignment: .leading, spacing: 4) {
                        
                        //user info
                            
                            HStack {
                                
                                Text(user.fullname)
                                    .font(.subheadline).bold()
                                
                                Text("@\(user.username)")
                                    .foregroundColor(.gray)
                                    .font(.caption)
                                
                                Text("2w")
                                    .foregroundColor(.gray)
                                    .font(.caption)

                            }
                        
                        
                        // tweet caption
                        
                        Text(tweets.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                        
                    }
                    
                }
                
                
            }
            
            // action buttons

            HStack {
                
                Button {
                    // action goes here
                } label: {
                    
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    // action goes here
                } label: {
                    
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()

                
                Button {
                    // action goes here
                } label: {
                    
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                
                Spacer()

                Button {
                    // action goes here
                } label: {
                    
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }

                
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
        //.padding()
        
    }
}

//struct TweetRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetRowView(tweets: tweet)
//    }
//}
