//
//  SideMenuViewModel.swift
//  TwitterClone2
//
//  Created by benny mushiya on 08/03/2022.
//

import Foundation



enum SideMenuViewModel: Int, CaseIterable {
    
    case Profile
    case lists
    case bookmarks
    case logout
    
    
    var title: String {
        
        switch self {
            
        case .Profile: return "Profile"
            
        case .lists:  return "Lists"
            
        case .bookmarks:  return "Bookmarks"
            
        case .logout:  return "Logout"
            
        }
    }
    
    var imageName: String {
        
        switch self {
            
        case .Profile: return "person"
            
        case .lists:  return "list.bullet"
            
        case .bookmarks:  return "bookmark"
            
        case .logout:  return "arrow.left.square"
            
        }
    }
    
    
    
}
