//
//  ImagePicker.swift
//  TwitterClone2
//
//  Created by benny mushiya on 10/03/2022.
//


import SwiftUI


//extracts the view from the viewController  to give us what we need, to show in swiftUI. in this case the image picker functionality because swiftUI doesnt have all the native functionality yet, therefore we can get it from UIKit.
struct ImagePicker: UIViewControllerRepresentable {
    
    // this property gets initialised with the state property on regisrationView, because there binded together.
    @Binding var image: UIImage?
    
    
    // we use to dismiss the image picker after the user has chosen an image.
    @Environment(\.presentationMode) var mode
    
    
    // coordinator is the link and communication gap between a UIViewController and a swiftUI View. basically the middle man.
    func makeCoordinator() -> coordinator {
        
        coordinator(self)
    }
    
    // used if we want to update the UIViewController. its part of the protocol so we have to implement it.
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    

    // we declare we want a imagePicker controller here, so we get it back so we can use it.
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let picker = UIImagePickerController()
        
        // without conforming the delegate method this viewController will not work.
        picker.delegate = context.coordinator
        
        return picker
    }
    
}


// here we implement the functionality the ImagePickerController needs to have to work.
extension ImagePicker {
    
    class coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        // the coordinator needs a parent property so they can communicate with a parent class such as UIImagePickerController
        let parent: ImagePicker
        
        
        // the parent class is recognised as a denpendcy injection
        init(_ parent: ImagePicker) {
            self.parent = parent
            
        }
        
        // whenever this imagePicker Controller selects an image, we get the selected image and set it the parent Image property.
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            guard let image = info[.originalImage] as? UIImage else {return}
            parent.image = image
            
            // dismisses the imagePicker after weve selected an image
            parent.mode.wrappedValue.dismiss()
        }
    }
}





