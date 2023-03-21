//
//  SigninView.swift
//  OnlineShoppee
//
//  Created by anita on 3/10/23.
//

import SwiftUI

struct SignUpView: View {
    
    // MARK: Properties
    
    @StateObject var signupViewModel: SignUpViewModel
    @EnvironmentObject var session: SessionManager
    
    // MARK: View
  
    var body: some View {
        
        VStack {
            Text("Sign in")
                .font(.custom(.bold, size: 24))
                .padding(.top, 128)
    
            VStack(spacing: 35) {
                
                TextField("First name", text:  $signupViewModel.manager.user.firstName) {
                    UIApplication.shared.dismissKeyboard()
                }
                     .modifier(TextFieldModifier())
               
                TextField("Last name", text:  $signupViewModel.manager.user.lastName) {
                    UIApplication.shared.dismissKeyboard()
                }
                    .modifier(TextFieldModifier())
                TextField("Email", text: $signupViewModel.manager.user.email) {
                    UIApplication.shared.dismissKeyboard()
                }
                    .modifier(TextFieldModifier())
                
                PasswordTextField(user: $signupViewModel.manager.user)
                Button {
                    signupViewModel.validateSignUp(session: session)
                   
                } label: {
                    Text("Sign in")
                        .modifier(ButtonModifier())
                }
              
            }
            HStack(spacing: 8) {
                Text("Already have an account?")
                
                Button {
                    signupViewModel.coordinator?.openLogInPage()
                } label: {
                    Text("Log in")
                   
                }

            }
                .font(.custom(.regular, size: 10))
                .padding(.leading, -100)
            Spacer().frame(height: 70)
            ServiceSignUp()
            Spacer()

            
        }
        .onTapGesture {
            UIApplication.shared.dismissKeyboard()
        }
        .alert(isPresented: $signupViewModel.manager.hasError, error: signupViewModel.manager.error) {
            
        }
        
       
        
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(signupViewModel: SignUpViewModel(coordinator: SignUpCoordinator(parent: AuthorizationFlowCoordinator()), userStorage: UserStorage.shared, manager: RegistrationManager()))
            .environmentObject(SessionManager())
    }
}

// MARK: Service Button View

struct SigninWithButton: View {
    let textLabel: String
    let iconImage: String
    
    var body: some View {
        Button {
            
        } label: {
            Label(textLabel, image: iconImage)
                .font(.custom(.medium, size: 14))
                .foregroundColor(.black)
        }
    }
}

struct ServiceSignUp: View {
    var body: some View {
        VStack(spacing: 30) {
            SigninWithButton(textLabel: "Sign in with Google", iconImage: "google")
            SigninWithButton(textLabel: "Sign in with Apple", iconImage: "apple")
            
        }
    }
}

