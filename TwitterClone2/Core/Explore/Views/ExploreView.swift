//
//  ExploreView.swift
//  TwitterClone2
//
//  Created by benny mushiya on 08/03/2022.
//

import SwiftUI

struct ExploreView: View {
    
    @ObservedObject var viewModel = ExploreViewModel()
    
    var body: some View {
     
        VStack {
            
            SearchBar(text: $viewModel.searchText)
            
            ScrollView{
                
                LazyVStack {
                    
                    ForEach(viewModel.searchableUsers) { user in
                        NavigationLink {
                            
                            // this is where it will take me when i press it
                           ProfileView(user: user)
                            
                        } label: {
                            
                            // this is where i want it to press from
                            UserRowView(user: user)

                        }

                    }
                }
                
            }
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
