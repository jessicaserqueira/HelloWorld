//
//  CreateAccountViewModelling.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 15/05/23.
//

import SwiftUI

public protocol CreateAccountModelling: ObservableObject {
    var createAccount: CreateAccountModel { get set }
    var isButtonDisabled: Bool { get }
    var image: UIImage { get set }
    var formInvalid: Bool { get set }
    var alertText: String { get }
    var isLoading: Bool { get }
    
    func returnLoginView()
    func buttonCreateAccount()
    func dismissModal()
}
