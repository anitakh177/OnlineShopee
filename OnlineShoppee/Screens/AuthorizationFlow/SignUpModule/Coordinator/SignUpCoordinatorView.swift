//
//  SignUpCoordinatorView.swift
//  OnlineShoppee
//
//  Created by anita on 3/21/23.
//

import SwiftUI

struct SignUpCoordinatorView: View {
    @ObservedObject var coordinator: SignUpCoordinator
    var body: some View {
        NavigationView {
            SignUpView(signupViewModel: coordinator.viewModel)
    
                .navigation(item: $coordinator.logInCoordinator) { coordinator in
                    LogInCoordinatorView(coordinator: coordinator)
                }
        }
       
    }
}

struct SignUpCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpCoordinatorView(coordinator: SignUpCoordinator(parent: AuthorizationFlowCoordinator()))
    }
}
