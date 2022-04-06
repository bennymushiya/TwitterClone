//
//  TextArea.swift
//  TwitterClone2
//
//  Created by benny mushiya on 09/03/2022.
//

import SwiftUI


// becasue textEditors dont have placeholders, we have to build a custom View to place the placholder ourselves

struct TextArea: View {
    
    @Binding var text: String
    let placeholder: String
    
    // this is how we initialise a binding property.
    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
        
        // gives our textView a backgroundColor.
        UITextView.appearance().backgroundColor = .clear
        
    }
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            
            if text.isEmpty {
                
                Text(placeholder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
                
            }
            TextEditor(text: $text)
                .padding(4)
            
        }
        .font(.body)
        
        
    }
}



