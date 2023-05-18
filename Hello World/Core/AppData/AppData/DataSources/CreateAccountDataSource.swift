//
//  File.swift
//  AppData
//
//  Created by Jessica Serqueira on 17/05/23.
//

import Common
import Foundation
import UIKit

public protocol CreateAccountDataSource: AnyObject {
    var formInvalid: Bool { get set }
    var alertText: String { get set }
    
    func signUp(withEmail email: String, password: String, image: UIImage, name: String, completion: @escaping (String?) -> Void)
}
