//
//  Tweet.swift
//  TwitterClone2
//
//  Created by benny mushiya on 12/03/2022.
//

import FirebaseFirestoreSwift
import Firebase


struct Tweet: Identifiable, Decodable {
    
    
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    
    var user: User?
    
}
