//
//  ImageUploader.swift
//  TwitterClone2
//
//  Created by benny mushiya on 10/03/2022.
//

import UIKit
import Firebase



struct ImageUploader {
    
    
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        
        // grabs the image and gives us back the image data and compressess it to half the original size. so when we download the images it wont be a large file to download, which makes our app faster and limit our data usage for the app.
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return}
        
        let filename = NSUUID().uuidString
        
        // we create a path to store the image
        let ref = Storage.storage().reference(withPath: "/profile_image/\(filename)")
        
        
        // we upload the image to storage.
        ref.putData(imageData, metadata: nil) { _, error in
            
            if let error = error {
                
                print("DEBUGG: FAILED TO UPLOAD IMAGE \(error.localizedDescription)")
                return
                
            }
            
            ref.downloadURL { imageUrl, error in
                
                if let error = error {
                    
                    print("DEBUGG: FAILED TO UPLOAD IMAGE \(error.localizedDescription)")
                    return
                }
                
                guard let imageUrl = imageUrl?.absoluteString else {return}
                completion(imageUrl)
            }
        }
        
    }
    
    
}

