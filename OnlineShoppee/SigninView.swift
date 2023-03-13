//
//  SigninView.swift
//  OnlineShoppee
//
//  Created by anita on 3/10/23.
//

import SwiftUI

struct SigninView: View {
    @EnvironmentObject var session: SessionManager
    @StateObject private var manager = RegistrationManager()
   
    @StateObject var userViewModel = UserStorage()
    
    @State private var showPassword: Bool = false
    @FocusState var inFocus: Field?

    enum Field {
        case secure, plain
        }
    
    var body: some View {
        
        VStack {
            Text("Sign in")
                .font(.title)
                .padding(.top, 128)
                Spacer()
                .frame(height: 60)
            VStack(spacing: 35) {
                TextFieldView(textProp: $manager.user.firstName, title: "First name")
                TextFieldView(textProp: $manager.user.lastName, title: "Last name")
                TextFieldView(textProp: $manager.user.email, title: "Email")
                
                ZStack(alignment: .trailing)
                { if showPassword {
                    TextFieldView(textProp: $manager.user.password, title: "Password")
                        .focused($inFocus, equals: .plain)
                } else {
                    SecureTextFieldView(textProp: $manager.user.password, title: "Password")
                        .focused($inFocus, equals: .secure)
                }
                    Button {
                        self.showPassword.toggle()
                        inFocus = showPassword ? .plain : .secure
                    } label: {
                        Image("security")
                    }
            
                    .padding(.trailing, 15)
                }
                Button {
                  
                    manager.validate()
                   userViewModel.validateUser(firstName: manager.user.email, password: manager.user.password)
                    if !manager.hasError  && !userViewModel.hasError {
                        // TODO: Handle registration
                        userViewModel.addUser(user: manager.user)
                        session.logIn()
                    }
                    
                } label: {
                    ButtonView(buttonText: "Sign in")
                }
                .alert(isPresented: $userViewModel.hasError, error: userViewModel.error) {
                }
  
            }
            HStack(spacing: 8) {
                Text("Already have an account?")
                Button {
                    session.moveToLogInView()
                } label: {
                    Text("Log in")
                }

            }
            
                .font(.caption2)
                .padding(.leading, -100)
            Spacer().frame(height: 70)
            VStack(spacing: 30) {
                SigninWithButton(textLabel: "Sign in with Google", iconImage: "google")
                SigninWithButton(textLabel: "Sign in with Apple", iconImage: "apple")

            }
            Spacer()

            
        }
       .alert(isPresented: $manager.hasError, error: manager.error) {
            
        }
       
        
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
            .environmentObject(SessionManager())
    }
}

struct SigninWithButton: View {
    let textLabel: String
    let iconImage: String
    
    var body: some View {
        Button {
            
        } label: {
            Label(textLabel, image: iconImage)
                .foregroundColor(.black)
        }
    }
}
