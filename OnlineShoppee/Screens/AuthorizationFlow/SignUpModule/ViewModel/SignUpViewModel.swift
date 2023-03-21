//
//  SignUpViewModel.swift
//  OnlineShoppee
//
//  Created by anita on 3/13/23.
//

import Foundation


final class SignUpViewModel: ObservableObject {
    @Published var manager: RegistrationManager
    @Published var hasErrorV: Bool = false
    private let userStorage: UserStorage
    unowned let coordinator: SignUpCoordinator
    
    init(coordinator: SignUpCoordinator, userStorage: UserStorage, manager: RegistrationManager) {
        self.coordinator = coordinator
        self.userStorage = userStorage
        self.manager = manager
    }
    
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
