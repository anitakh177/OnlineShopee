//
//  AuthorizationFlowCoordinator.swift
//  OnlineShoppee
//
//  Created by anita on 3/21/23.
//

import SwiftUI

@MainActor
class AuthorizationFlowCoordinator: ObservableObject {
    
    // MARK: Stored Properties
    
    @Published var signUpCoordinator: SignUpCoordinator!
    @Published var logInCoordinator: LogInCoordinator!
    
    init() {
        signUpCoordinator = .init(parent: self)
        logInCoordinator = .init(parent: self)
    }
}
