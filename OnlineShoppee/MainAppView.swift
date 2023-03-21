//
//  MainAppView.swift
//  OnlineShoppee
//
//  Created by anita on 3/11/23.
//

import SwiftUI

struct MainAppView: View {
    
    @EnvironmentObject var session: SessionManager
   
    var body: some View {
        switch session.currentState {
        case .signUp:
            SignUpView()
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
        case .loggedIn:
            AppTabBarView(coordinator: MainFlowCoordinator())
                .transition(.opacity)
        case .logInView:
            LoginView()
                .transition(.opacity)
        default:
           SignUpView()
                .transition(.opacity)
        }
    }
}

struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
            .environmentObject(SessionManager())
    }
}
