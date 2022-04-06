//
//  UserService.swift
//  TwitterClone2
//
//  Created by benny mushiya on 11/03/2022.
//

import Firebase
import FirebaseFirestoreSwift

// the reason we create separate service classes or structs are for reusability.

struct UserService {
    
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        
        
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
            
            if let error = error {
                
                print("DEBUGG: FAAILED TO FETCH USER \(error.localizedDescription)")
                return
                
            }
            
            guard let snapshots = snapshot else {return}
            
            guard let user = try? snapshots.data(as: User.self) else {return}
            
          
            completion(user)

            
        }
        
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void) {
        
       // var users = [User]()
        
        Firestore.firestore().collection("users").getDocuments { snapshot, error in
            
            if let error = error {
                
                print("DEBUGG: FAILED TO FETCH USERS \(error.localizedDescription)")
                
                return
                
            }
            
            guard let snapshot = snapshot?.documents else {return}
            
        
            // this is known as higher order function, which allows us to shorten our for loops by mapping through it. and the $0 represents each documents inside the array.
            let users = snapshot.compactMap({try? $0.data(as: User.self)})
            
            completion(users)
            
//            snapshot.forEach { docs in
//
//                guard let user = try? docs.data(as: User.self) else {return}
//                users.append(user)
//
//            }
            
        }
    }
    
    
    
}
