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
            SigninView()
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
        case .loggedIn:
            ProfileView()
                .transition(.opacity)
        case .logInView:
            LoginView()
                .transition(.opacity)
        default:
           SigninView()
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
