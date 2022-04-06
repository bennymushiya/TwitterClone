//
//  AuthViewModel.swift
//  TwitterClone2
//
//  Created by benny mushiya on 10/03/2022.
//

import SwiftUI
import Firebase


class AuthViewModel: ObservableObject {
    
    //  because this is a published variable, whenever it gets sets it publishes whatever its set with to each view that is using it or the viewModel, user session is the actaul user.
    @Published var userSession: FirebaseAuth.User?
    
    // when we authenticate a user this property will change it value to true.
    @Published var didAuthenticateUser = false
    
    // in this AuthViewModel we have access to our signed in user because we fetched him when this view was initialised. because its a published property, when it updates it will update all of our Views that calls that rpoperty with the new data.
    @Published var currentUser: User?
    
    private var tempUserSession: FirebaseAuth.User?
    
    private let services = UserService()
    
    init() {
        
        // if a currentUser or a user is logged in, were gonna store the user session in the @published variable above. also reaches out to the firebase server to see if user is logged in
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
        
        
        
        
    }
    
    
    func login(withEmail email: String, password: String) {
        
        
        Auth.auth().signIn(withEmail: email, password: password) { results , error in
            if let error = error {
                
                print("DEBUGG: FAILED TO LOG IN \(error.localizedDescription)")
                return
            }
            
            guard let user = results?.user else {return}
            self.userSession = user
            print("DEBUGG: SUCCESSFULLY LOGGED")
            self.fetchUser()
        }
        
    }
    
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        

        Auth.auth().createUser(withEmail: email, password: password) { results, error in
            
            if let error = error {
                
                print("DEBUGG: FAILED TO REGISTER WITH ERROR \(error.localizedDescription)")
                
                // we return out of the function if something went wrong because we dont want to keep going if something went wrong.
                return
            }
            
            // because this user property is the same firebaseAuth user at the top.
            guard let user = results?.user else {return}
            //self.userSession = user
            
            // we store the actaul user created into this temporary property because we need the user UID to store the image into the correct user data
            self.tempUserSession = user
            
            
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid]
            
            
            Firestore.firestore().collection("users").document(user.uid).setData(data) { error in
                if let error = error {
                    
                    print("DEBUGG: FAILED TO STORE USER DATA BECUASE \(error.localizedDescription)")
                    return
                }
                
                print("DEBUGG: SUCCESFULLY STORED USER DATA")
                self.didAuthenticateUser = true
            }
        }
        
    }
    
    
    func signOut() {
        
        // sets user session to nil so we show login view/ logs us out client side
        userSession = nil
        
        // signs user out on server/ backend
        try? Auth.auth().signOut()
        
    }
    
    // uploads our profileImage, then goes into the database and uploads the user structure and once that proccess completes, then we set the tempUserSession the the main usersession that it takes us over the our mainUserInterface
    func uploadProfileImage(_ image: UIImage) {
        
        guard let uid = tempUserSession?.uid else {return}
        
        ImageUploader.uploadImage(image: image) { profileImageURL in
            
            Firestore.firestore().collection("users").document(uid).updateData(["profileImage": profileImageURL]) { error in
                
                if let error = error {
                    
                    print("DEBUGG: FAILED TO STORE ADDITOIONAL IMAGE \(error.localizedDescription)")
                    return
                }
                
                self.userSession = self.tempUserSession
                
                // we fetch it here so we can fetch the new users information when a different user logs in.
                self.fetchUser()
            }
        }
        
    }
    
    
    func fetchUser() {
        
        
        guard let uid = self.userSession?.uid else {return}
        
        services.fetchUser(withUid: uid) { user in
            self.currentUser = user
            
        }
    }
    
}
