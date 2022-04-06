//
//  MainTabView.swift
//  TwitterClone2
//
//  Created by benny mushiya on 08/03/2022.
//

import SwiftUI

struct MainTabView: View {
    
    // everytime we click on a different tab this state variable changes to that number we assigned the tab. then it will change the view becasue that will be a view we have assigned to that specicic number.
    @State private var selectedIndex = 0
    
    var body: some View {
       
        TabView(selection: $selectedIndex) {
            
            FeedView()
                .onTapGesture {
                    self.selectedIndex = 0
                }
                .tabItem {
                    
                    Image(systemName: "house")
                        .tag(0)
                }
            
            ExploreView()
                .onTapGesture {
                    self.selectedIndex = 1
                }
                .tabItem {
                    
                    Image(systemName: "magnifyingglass")
                        .tag(1)
                }
            
            NotificationsView()
                .onTapGesture {
                    self.selectedIndex = 2
                }
                .tabItem {
                    
                    Image(systemName: "bell")
                        .tag(2)
                }
            
            MessagesView()
                .onTapGesture {
                    self.selectedIndex = 3
                }
                .tabItem {
                    
                    Image(systemName: "envelope")
                        .tag(3)
                }
            
            
        }
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
