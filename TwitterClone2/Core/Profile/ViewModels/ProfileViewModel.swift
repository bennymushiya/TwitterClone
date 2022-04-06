//
//  ProfileViewModel.swift
//  TwitterClone2
//
//  Created by benny mushiya on 13/03/2022.
//

import Foundation



class ProfileViewModel: ObservableObject {
    
    @Published var tweets = [Tweet]()
    private let service = TweetService()
    let user: User
    
    
    
    init(user: User) {
        self.user = user
        self.fetchUserTweets()
        
        
    }
    
    func fetchUserTweets() {
        
        guard let uid = user.id else {return}
        
        
        service.fetchTweets(ForUid: uid) { tweets in
                self.tweets = tweets
            
            for i in 0 ..< tweets.count {
                self.tweets[i].user = self.user
                
            }
        }
    }
        
}
    
    
    

