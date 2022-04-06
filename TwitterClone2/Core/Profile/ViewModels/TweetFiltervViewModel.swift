//
//  TweetFiltervViewModel.swift
//  TwitterClone2
//
//  Created by benny mushiya on 08/03/2022.
//

import Foundation


// this caseIterable protocol weve adopted, allows us to treat all of our enum cases like an array, so we can loop through it.
enum TweetFiltervViewModel: Int, CaseIterable {
    
    case tweets
    case replies
    case likes
    
    
    var title: String {
        
        switch self {
        
        case .tweets: return "Tweets"
            
        case .replies: return "Replies"
            
        case .likes: return "Likes"
            
        }
    }
    
    
}
