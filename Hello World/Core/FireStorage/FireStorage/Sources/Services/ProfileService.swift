//
//  File.swift
//  FireStorage
//
//  Created by Jessica Serqueira on 13/06/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage
import AppData

public class ProfileService {
    
    public init() {}
    
    public func getProfile(completion: @escaping ([ProfileDTO]) -> Void) {
        var profile: [ProfileDTO] = []
        Firestore.firestore().collection("users")
            .getDocuments { querySnapshot, error in
                if let error = error {
                    print("Erro ao buscar contatos: \(error)")
                    return
                }
                
                for document in querySnapshot!.documents {
                    if Auth.auth().currentUser?.uid != document.documentID {
                        print("ID \(document.documentID) \(document.data())")
                        profile.append(ProfileDTO(uuid: document.documentID,
                                                  name: document.data()["name"] as! String,
                                                  email: document.data()["email"] as! String,
                                                  profileUrl: document.data()["profileUrl"] as! String))
                    }
                }
                
                completion(profile)
            }
    }
}
