//
//  LogInCoordinator.swift
//  OnlineShoppee
//
//  Created by anita on 3/21/23.
//

import SwiftUI

@MainActor
final class LogInCoordinator: ObservableObject, Identifiable {
    
    private weak var parent: AuthorizationFlowCoordinator?
    @Published var viewModel: LogInViewModel?
    
    init(parent: AuthorizationFlowCoordinator?) {
        self.parent = parent
        self.viewModel = LogInViewModel(coordinator: self, manager: RegistrationManager())
    }
    
}
