//
//  AuthorizationFlowCoordinatorView.swift
//  OnlineShoppee
//
//  Created by anita on 3/21/23.
//

import SwiftUI

struct AuthorizationFlowCoordinatorView: View {
    @ObservedObject var coordinator: AuthorizationFlowCoordinator
    var body: some View {
        SignUpCoordinatorView(coordinator: coordinator.signUpCoordinator)

    }
}

struct AuthorizationFlowCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationFlowCoordinatorView(coordinator: AuthorizationFlowCoordinator())
    }
}
