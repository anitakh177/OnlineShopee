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
    
    unowned let coordinator: LogInCoordinator
   
    var manager: RegistrationManager
    @Published var hasError: Bool = false
    
    init(coordinator: LogInCoordinator, manager: RegistrationManager) {
        self.coordinator = coordinator
        self.manager = manager
    }
    
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

