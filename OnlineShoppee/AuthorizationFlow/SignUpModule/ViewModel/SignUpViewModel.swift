//
//  SignUpViewModel.swift
//  OnlineShoppee
//
//  Created by anita on 3/13/23.
//

import Foundation


final class SignUpViewModel: ObservableObject {
     var manager = RegistrationManager()
     var userStorage = UserStorage()
    @Published var hasError: Bool = false
    
    
    func validateSignUp() {
        manager.validate()
       userStorage.validateUser(firstName: manager.user.email, password: manager.user.password)
        if !manager.hasError  && !userStorage.hasError {
            userStorage.addUser(user: manager.user)
            hasError = false
        } else {
            hasError = true
        }
    }
    
}
