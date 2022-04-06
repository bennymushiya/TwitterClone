//
//  AuthentificationHeader.swift
//  TwitterClone2
//
//  Created by benny mushiya on 09/03/2022.
//

import SwiftUI

struct AuthentificationHeaderView: View {
    
    let title1: String
    let title2: String
    
    var body: some View {
        
        //headerView
        VStack(alignment: .leading) {
            
            // makes the blue container fill the whole width
            HStack { Spacer() }
            
            Text(title1)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(title2)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
        }
        .frame(height: 260)
        .padding(.leading)
        .background(.blue)
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight]))
    }
}

struct AuthentificationHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthentificationHeaderView(title1: "hello", title2: "welcome")
    }
}
