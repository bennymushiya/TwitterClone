//
//  TweetService.swift
//  TwitterClone2
//
//  Created by benny mushiya on 12/03/2022.
//

import Firebase


struct TweetService {
    
    
    func uploadTweet(caption: String, completion: @escaping(Bool) -> Void) {
        
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        // we cast it as string any because we have different data types as our values.
        let data = ["uid": uid,
                    "caption": caption,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
        
        Firestore.firestore().collection("tweets").document().setData(data) { error in
            if let error = error {
                
                print("DEBUGG: FAILED TO UPLOAD TWEET \(error.localizedDescription)")
                completion(false)
                return
            }
            
            print("DEBUGG: SUCCESSFULLY UPLAODED TWEET")
            completion(true)
        }
        
    }
    
    func fetchTweets(completion: @escaping([Tweet]) -> Void) {
        
        Firestore.firestore().collection("tweets").order(by: "timestamp", descending: true).getDocuments { snapshot, error in
            
            if let error = error {
                
                print("DEBUGG: FAILED TO FETCH TWEETS \(error.localizedDescription)")
                return
            }
            
            guard let documents = snapshot?.documents else { return }
            
            let tweets = documents.compactMap({ try? $0.data(as: Tweet.self )})
            
            completion(tweets)
            
            }
        }
    
    
    func fetchTweets(ForUid uid: String, completion: @escaping([Tweet]) -> Void) {
        
        Firestore.firestore().collection("tweets").whereField("uid", isEqualTo: uid).getDocuments { snapshot, error in
            
            if let error = error {
                
                print("DEBUGG: FAILED TO FETCH TWEETS \(error.localizedDescription)")
                return
            }
            
            guard let documents = snapshot?.documents else { return }
            
            let tweets = documents.compactMap({ try? $0.data(as: Tweet.self )})
            
            completion(tweets.sorted(by: {$0.timestamp.dateValue() > $1.timestamp.dateValue() }))
            
            }
        
      }
    
    
}
    

