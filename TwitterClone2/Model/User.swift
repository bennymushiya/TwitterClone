//
//  User.swift
//  TwitterClone2
//
//  Created by benny mushiya on 11/03/2022.
//

import FirebaseFirestoreSwift

// the decodable protocol goes through each keys inside the data dictionary and looks for the exact name of each key that matches our object below to the API, if the name of the keys are different here than it is in the object then the decodable protocol will fail.
struct User: Identifiable, Decodable {
    
    @DocumentID var id: String?
    let email: String
    let username: String
    let fullname: String
    let profileImage: String
    
    
}
