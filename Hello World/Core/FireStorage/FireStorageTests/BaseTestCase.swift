//
//  BaseTestCase.swift
//  FireStorageTests
//
//  Created by Jessica Serqueira on 24/05/23.
//

import XCTest
import Firebase
import FirebaseAuth

class BaseTestCase: XCTestCase {
    override class func setUp() {
        super.setUp()
        FirebaseApp.configure()
        
        do {
            try Auth.auth().useUserAccessGroup("group.jessica.com.HelloWorld")
        } catch let error {
            XCTFail("Failed to set user access group: \(error.localizedDescription)")
        }
    }
}
