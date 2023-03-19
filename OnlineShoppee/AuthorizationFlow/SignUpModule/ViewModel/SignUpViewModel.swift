//
//  SignUpViewModel.swift
//  OnlineShoppee
//
//  Created by anita on 3/13/23.
//

import Foundation


final class SignUpViewModel: ObservableObject {
     var manager = RegistrationManager()
    @Published var hasErrorV: Bool = false
    
    
    func validateSignUp(session: SessionManager) {
        manager.validateSignUp()
        if !manager.hasError {
            hasErrorV = false
            userStorage.addUser(user: manager.user)
            session.logIn()
        } else {
            hasErrorV = true
            
        }
    }
    
}
