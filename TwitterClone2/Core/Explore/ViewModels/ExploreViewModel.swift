//
//  ExploreViewModel.swift
//  TwitterClone2
//
//  Created by benny mushiya on 11/03/2022.
//

import Foundation


class ExploreViewModel: ObservableObject {
    
    @Published var users = [User]()
    let services = UserService()
    
    @Published var searchText = ""
    
    var searchableUsers: [User] {
        
        if searchText.isEmpty {
            
            return users
            
        } else {
            
            let lowercassedQuery = searchText.lowercased()
            
            return users.filter {
                
                $0.username.contains(lowercassedQuery) ||
                $0.fullname.lowercased().contains(lowercassedQuery)
            }
        }
        
    }
    
    
    init() {
        fetchUsers()
        
    }
    
    func fetchUsers() {
        
        services.fetchUsers { users in
            self.users = users
            
            //print("DEBUGG: USERS \(users)")
        }
    }
    
}
