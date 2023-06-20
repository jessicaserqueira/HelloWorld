//
//  LoginPersistenceService.swift
//  FireStorage
//
//  Created by Jessica Serqueira on 15/05/23.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore
import UIKit

public class CreateAccountService {
    private let userId: String
    
    public init() {
        if let currentUser = Auth.auth().currentUser {
            self.userId = currentUser.uid
        } else {
            self.userId = "default value"
        }
    }
    
    public func signUp(withEmail email: String, password: String, image: UIImage, name: String, completion: @escaping (String?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self, let user = result?.user, error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                completion(error?.localizedDescription)
                return
            }
            
            print("Usuario criado \(user.uid)")
            
            self.uploadPhoto(image: image, name: name, email: email) { error in
                if let error = error {
                    completion(error)
                } else {
                    completion(nil)
                }
            }
        }
    }
    
    private func uploadPhoto(image: UIImage, name: String, email: String, completion: @escaping (String?) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.2) else {
            completion(NSError(domain: "com.yourapp.upload", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to convert image to data"]) as? String)
            return
        }
        
        let filename = UUID().uuidString
        let storageRef = Storage.storage().reference().child("images/\(filename).jpg")
        
        storageRef.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                completion(error.localizedDescription)
                return
            }
            
            storageRef.downloadURL { url, error in
                if let error = error {
                    completion(error.localizedDescription)
                    return
                }
                
                guard let downloadURL = url else {
                    completion(NSError(domain: "com.yourapp.upload", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to retrieve download URL"]) as? String)
                    return
                }
                
                print("Foto criada \(downloadURL)")
                self.createUser(photoUrl: downloadURL, name: name, email: email, completion: completion)
            }
        }
    }
    
    public func createUser(photoUrl: URL, name: String, email: String, completion: @escaping (String?) -> Void) {
        let uuid = UUID().uuidString
        let userDocumentRef = Firestore.firestore().collection("users").document(uuid)
        
        let userData: [String: Any] = [
            "name": name,
            "email": email,
            "uuid": uuid,
            "profileUrl": photoUrl.absoluteString
        ]
        
        userDocumentRef.setData(userData) { error in
            if let error = error {
                completion(error.localizedDescription)
                return
            }
            
            completion(nil)
        }
    }
}
