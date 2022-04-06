//
//  SideMenuOptionRowView.swift
//  TwitterClone2
//
//  Created by benny mushiya on 09/03/2022.
//

import SwiftUI

struct SideMenuOptionRowView: View {
    
    let viewModel: SideMenuViewModel
    
    var body: some View {
        
        HStack(spacing: 16) {
            
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundColor(.black)
            
            Text(viewModel.title)
                .font(.subheadline)
            
            Spacer()
        }
        // gives the items inside spacing
        .frame(height: 40)
        .padding(.horizontal)
        
    }
}


struct SideMenuOptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        
        SideMenuOptionRowView(viewModel: .Profile)
    }
}
