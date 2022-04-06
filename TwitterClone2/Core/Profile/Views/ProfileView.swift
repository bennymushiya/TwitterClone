//
//  ProfileView.swift
//  TwitterClone2
//
//  Created by benny mushiya on 08/03/2022.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    
    // everytime the filter is tapped its gonna update this state property or iterate through based on what the selected property is.
    @State private var selectedFilter: TweetFiltervViewModel = .tweets
    
    // used for the animation at the bottom
    @Namespace var animation
    
    @Environment(\.presentationMode) var mode
    
    @ObservedObject var viewModel: ProfileViewModel
    
    private let user: User
    
    // this is a dependency injection, its dependent upon an object before it fully initialises, if that object is nil then the View will not initialise
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
        
    }
    
    var body: some View {
        
        //parent
        VStack(alignment: .leading) {
            
            headerView
            
            actionButtons
            
            userInfoDetails
            
            tweetFilterBar
            
            tweetsView
          
            Spacer()
            
            
        }
        .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(id: NSUUID().uuidString, email: "sasuke@gmail.com", username: "chilin", fullname: "aahahah", profileImage: ""))
        
    }
}



// we extracted it becasue this main View contains alot of components, and we dont want the main View to get too crowded with code
extension ProfileView {
    
    // top headerView
    var headerView: some View {
        // because we dont want the color to fill the whole screen we give it frame of 96
        ZStack(alignment: .bottomLeading) {
            
            Color.blue
                .ignoresSafeArea()
            
            // its at the bottom because we initialised it with bottomLeading
            VStack {
                
                Button {
                    // action
                    mode.wrappedValue.dismiss()
                    
                } label: {
                    
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 12, y: -4)
                }

                
                KFImage(URL(string: user.profileImage))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 72, height: 72)
                    .clipShape(Circle())
                    .offset(x: 16, y: 24)
                
                // this is how we make it half way through the zStack and half way through the rest of the View
                .offset(x: 16, y: 24)
            }
            
        }
        .frame(height: 96)
            
    }
    
    // actionButtons
    var actionButtons: some View {
        
        
        HStack(spacing: 12) {
            
            // to get all the components to the right of the screen
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
            Button {
                
                
            } label: {
                
                Text("Edit Profile")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                    .frame(width: 120, height: 32)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }

        }
        .padding(.trailing)
        
        }
    
    
    // user info
    var userInfoDetails: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            
            HStack {
                
                Text(user.fullname)
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.blue))
                
            }
            
            Text("@\(user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("strongest uchiha ")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24) {
                
                HStack {
                    
                    Image(systemName: "mappin.and.ellipse")
                    
                    Text("Konoha, HL")
                }
                
                
                HStack {
                    
                    Image(systemName: "link")
                    
                    Text("www.sasukeUchiha.com")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            
           UserStatsView()
            .padding(.vertical)
            
            
        }
        .padding(.horizontal)
        
        
    }
    
    
    // filter bar
    var tweetFilterBar: some View {
        
        HStack {
            
            ForEach(TweetFiltervViewModel.allCases, id: \.rawValue) { item in
                
                VStack {
                    
                    Text(item.title)
                        .font(.subheadline)
                    // if the selectedFilter property above is the same as the item then we make it bold, if not then we make it regular.
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    
                    
                    // we give every item a capsule but the unselected one we change the color to clear, for it to be more smoother.
                    if selectedFilter == item {
                        
                        Capsule()
                            .foregroundColor(Color(.blue))
                            .frame(height: 3)
                        
                        
                            .matchedGeometryEffect(id: "filter", in: animation)
                        
                    } else {
                        
                        Capsule()
                            .foregroundColor(.clear)
                            .frame(height: 3)

                    }
                    
                }
                .onTapGesture {
                    
                    withAnimation(.easeOut) {
                        
                        self.selectedFilter = item
                    }
                }
                
            }
            
        }
        
        // gives the whole Hstack a divider.
        .overlay(Divider().offset(x: 0, y: 16))
        
    }
    
    
    // the tweets 
    var tweetsView: some View {
        
        ScrollView {
            
            LazyVStack {
                
                ForEach(viewModel.tweets) { tweet in
                    
                    TweetRowView(tweets: tweet)
                        .padding()
                    
                }
                
            }
            
        }
    }
    
    
}
