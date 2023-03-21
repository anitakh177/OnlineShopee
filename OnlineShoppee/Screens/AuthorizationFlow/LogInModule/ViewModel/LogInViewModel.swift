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
    
    // MARK: Properties
    
    weak var coordinator: LogInCoordinator?
    var manager: RegistrationManager
    @Published var hasError: Bool = false
    
    // MARK: Init
    
    init(coordinator: LogInCoordinator, manager: RegistrationManager) {
        self.coordinator = coordinator
        self.manager = manager
    }
    
    // MARK: Internal Methods
    
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

