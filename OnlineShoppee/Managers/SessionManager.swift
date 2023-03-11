//
//  SessionManager.swift
//  OnlineShoppee
//
//  Created by anita on 3/11/23.
//

import Foundation

final class SessionManager: ObservableObject {
    
    enum CurrentState {
        case loggedIn
        case loggedOut
        case signUp
        case logInView
    }
    
    @Published private(set) var currentState: CurrentState?
    
    func moveToLogInView() {
        currentState = .logInView
    }
    
    func signUp() {
        currentState = .signUp
    }
    
    func logIn() {
        currentState = .loggedIn
    }
    
    func LogOut() {
        currentState = .loggedOut
    }
    
}
