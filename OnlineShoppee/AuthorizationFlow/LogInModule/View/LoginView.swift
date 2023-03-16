//
//  LoginView.swift
//  OnlineShoppee
//
//  Created by anita on 3/10/23.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var session: SessionManager
    @StateObject var logInViewModel = LogInViewModel()
    @State private var firstName: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    @FocusState var inFocus: Field?
    
    enum Field {
        case secure, plain
    }

    var body: some View {
        VStack {
        Text("Welcome back")
            .font(.title)
            .padding(.top, 128)
            .padding(.bottom, 80)
            VStack {
                VStack(spacing: 35) {
                    TextFieldView(textProp: $logInViewModel.manager.user.firstName, title: "First Name")
                    
                    ZStack(alignment: .trailing) {
                        if showPassword {
                            TextFieldView(textProp: $logInViewModel.manager.user.password, title: "Password")
                                .focused($inFocus, equals: .plain)
                        } else {
                            SecureTextFieldView(textProp: $logInViewModel.manager.user.password, title: "Password")
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

                   
                }
                Spacer().frame(height: 60)
                Button {
                        withAnimation {
                            logInViewModel.validateLogIn(session: session)
                        }
                } label: {
                    ButtonView(buttonText: "Login")
                }
                 Spacer()
            }
        }
        
        .alert(isPresented: $logInViewModel.userStorage.hasError, error: logInViewModel.userStorage.error) {
            
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(SessionManager())
    }
}



