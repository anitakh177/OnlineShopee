//
//  SignUpViewModel.swift
//  OnlineShoppee
//
//  Created by anita on 3/13/23.
//

import Foundation

final class SignUpViewModel: ObservableObject {
    // MARK: Properties
    
    @Published var manager: RegistrationManager
    @Published var hasErrorV: Bool = false
    private let userStorage: UserStorage
    weak var coordinator: SignUpCoordinator?
    
    // MARK: Init
    
    init(coordinator: SignUpCoordinator, userStorage: UserStorage, manager: RegistrationManager) {
        self.coordinator = coordinator
        self.userStorage = userStorage
        self.manager = manager
    }
    
    // MARK: Internal Methods
    
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
