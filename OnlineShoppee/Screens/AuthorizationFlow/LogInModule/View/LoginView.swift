//
//  LoginView.swift
//  OnlineShoppee
//
//  Created by anita on 3/10/23.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: Properties
    
    @EnvironmentObject var session: SessionManager
    @StateObject var logInViewModel: LogInViewModel
    @FocusState var inFocus: Field?
    
    // MARK: - View

    var body: some View {
        VStack {
        Text("Welcome back")
            .font(.custom(.bold, size: 24))
            .padding(.top, 128)
            .padding(.bottom, 80)
            VStack {
                VStack(spacing: 35) {
                    TextField("Email", text: $logInViewModel.manager.user.email)
                        .modifier(TextFieldModifier())
                    PasswordTextField(user: $logInViewModel.manager.user)
                }
                Spacer().frame(height: 60)
                Button {
                        withAnimation {
                            logInViewModel.validateLogIn(session: session)
                        }
                } label: {
                    Text("Login")
                        .modifier(ButtonModifier())
                }
                 Spacer()
            }
        }
        .onTapGesture {
            UIApplication.shared.dismissKeyboard()
        }
        
        .alert(isPresented: $logInViewModel.manager.hasError, error: logInViewModel.manager.error) {
            
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(logInViewModel: LogInViewModel(coordinator: LogInCoordinator(parent: AuthorizationFlowCoordinator()), manager: RegistrationManager()))
            .environmentObject(SessionManager())
    }
}



