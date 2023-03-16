//
//  LogInViewModel.swift
//  OnlineShoppee
//
//  Created by anita on 3/13/23.
//

import Foundation

final class LogInViewModel: ObservableObject {
    var userStorage = UserStorage()
    var manager = RegistrationManager()
    
    func validateLogIn(session: SessionManager) {
        userStorage.userEmpty(firstName: manager.user.firstName, password: manager.user.password)
        if !userStorage.hasError {
            session.logIn()
        }
    }
}
