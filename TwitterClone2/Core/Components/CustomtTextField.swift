//
//  CustomtTextField.swift
//  TwitterClone2
//
//  Created by benny mushiya on 09/03/2022.
//

import SwiftUI

struct CustomtTextField: View {
    
    let imageName: String
    let placeholderText: String
    var isSecureField: Bool? = false
    @Binding var text: String
    
    var body: some View {
       
        VStack {
            HStack {
                
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
                
                
                // this way we dont have to add the securefield everytime we create a customTextField, if its not there it will result to false.
                if isSecureField ?? false {
                    
                    SecureField(placeholderText, text: $text)
                    
                } else {
                    
                    TextField(placeholderText, text: $text)

                }
            }
            
            Divider()
                .foregroundColor(Color(.darkGray))
            
        }
    }
}


struct CustomtTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomtTextField(imageName: "envelope", placeholderText: "email", text: .constant(""))
    }
}
