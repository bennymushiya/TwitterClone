//
//  FeedView.swift
//  TwitterClone2
//
//  Created by benny mushiya on 08/03/2022.
//

import SwiftUI

struct FeedView: View {
    
    @State private var showNewTweetView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    
                    ForEach(viewModel.tweets) { tweet in
                        
                        TweetRowView(tweets: tweet)
                            .padding()
                        
                    }
                }
                
                
            }
            
            Button {
                
                showNewTweetView.toggle()
                
            } label: {
                
                Image(systemName: "house")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
                
            }
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            
            // this is bound to our state variable, so when we toggle our state variable this will present our new tweet view.
            .fullScreenCover(isPresented: $showNewTweetView) {
                
                NewTweetView()
            }
            

        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
