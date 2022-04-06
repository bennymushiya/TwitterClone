//
//  ContentView.swift
//  TwitterClone2
//
//  Created by benny mushiya on 08/03/2022.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    
    @State private var showMenu = false
    
    // we dont initialise it here but we declare it only, because were gonna use this variable through numerous places on the app. so instead of passing it around each view that needs it. we create this environmentObject so its usable within the whole environment of views. we initialise it in our app file, so we can use it because its been initialised there
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        Group {
            
            // no user logged in
            if viewModel.userSession == nil {
                LogInView()
                
            } else {
                
                // have a logged in user
                
                mainInterFaceView
                
                
            }
            
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension ContentView {
    
    
    var mainInterFaceView: some View {
        
        ZStack(alignment: .topLeading) {
            
            MainTabView()
            
            if showMenu {
                
                ZStack {
                    
                    Color(.black)
                        .opacity(showMenu ? 0.25 : 0)
                    
                }.onTapGesture {
                    withAnimation(.easeOut) {
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            // how we show the side menu
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0 : -300, y: 0)
                .background(showMenu ? .white : .clear)
            
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        
        // the profile Image on the navigationBar
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                
                if let user = viewModel.currentUser {
                    
                    Button {
                        
                        // this is how we show the side menu
                        withAnimation(.easeInOut) {
                            showMenu.toggle()

                        }
                        
                    } label: {
                        
                        KFImage(URL(string: user.profileImage))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())
                    }
                    
                }

              
            }
           
            }
        // gets called and shows show menu to false, when we come back from a another screen
        .onAppear {
            showMenu = false
        }
    }
    
}
