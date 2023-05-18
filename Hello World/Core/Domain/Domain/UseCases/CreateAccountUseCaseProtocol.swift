//
//  File.swift
//  Domain
//
//  Created by Jessica Serqueira on 17/05/23.
//

import Foundation
import UIKit

public protocol CreateAccountUseCaseProtocol {
    func signUp(withEmail email: String, password: String, image: UIImage, name: String, completion: @escaping (String?) -> Void)
}
