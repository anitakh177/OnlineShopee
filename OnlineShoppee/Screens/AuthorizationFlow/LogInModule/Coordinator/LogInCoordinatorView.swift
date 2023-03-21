//
//  LogInCoordinatorView.swift
//  OnlineShoppee
//
//  Created by anita on 3/21/23.
//

import SwiftUI

struct LogInCoordinatorView: View {
    @ObservedObject var coordinator: LogInCoordinator
    var body: some View {
        LoginView(logInViewModel: coordinator.viewModel)

    }
}

struct LogInCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        LogInCoordinatorView(coordinator: LogInCoordinator(parent: AuthorizationFlowCoordinator()))
    }
}
