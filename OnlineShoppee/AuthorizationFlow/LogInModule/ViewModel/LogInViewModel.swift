//
//  LogInViewModel.swift
//  OnlineShoppee
//
//  Created by anita on 3/13/23.
//

import SwiftUI

enum Field: Hashable {
    case secure, plain
}

final class LogInViewModel: ObservableObject {
   
    var manager = RegistrationManager()
    @Published var hasError: Bool = false
    
    func validateLogIn(session: SessionManager) {
        manager.validateLogin()
        
        if !manager.hasError {
            session.logIn()
            hasError = false
        } else {
            hasError = true
        }
        }
    }

