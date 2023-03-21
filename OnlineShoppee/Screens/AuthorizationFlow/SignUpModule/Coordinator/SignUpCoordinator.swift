//
//  SignUpCoordinator.swift
//  OnlineShoppee
//
//  Created by anita on 3/21/23.
//

import SwiftUI

@MainActor
final class SignUpCoordinator: ObservableObject, Identifiable {
    
    private unowned let parent: AuthorizationFlowCoordinator?
    @Published var viewModel: SignUpViewModel?
    @Published var logInCoordinator: LogInCoordinator?
    
    init(parent: AuthorizationFlowCoordinator?) {
        self.parent = parent
        self.viewModel = SignUpViewModel(coordinator: self, userStorage: UserStorage.shared, manager: RegistrationManager())
    }
    
    func openLogInPage() {
        logInCoordinator = LogInCoordinator(parent: parent)
    }
    
}
