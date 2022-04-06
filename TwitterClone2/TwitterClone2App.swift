//
//  TwitterClone2App.swift
//  TwitterClone2
//
//  Created by benny mushiya on 08/03/2022.
//

import SwiftUI
import Firebase

@main
struct TwitterClone2App: App {
    
    // this is where we initialise the AuthViewModel, so it can be used around its environment of Views without having to initialise it over and over again
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {

            NavigationView {
                
                ContentView()
                
                //RegistrationView()
                
            
            }
            // then we pass it as an environment object in our navigationView
                .environmentObject(viewModel)
            
            
        }
    }
}
