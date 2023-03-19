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
    @State private var showPassword: Bool = false
    @FocusState var inFocus: Field?
    
    enum Field {
        case secure, plain
    }

    var body: some View {
        VStack {
        Text("Welcome back")
            .font(.custom(.bold, size: 24))
            .padding(.top, 128)
            .padding(.bottom, 80)
            VStack {
                VStack(spacing: 35) {
                    TextField("First name", text: $logInViewModel.manager.user.firstName)
                        .modifier(TextFieldModifier())
                    
                    ZStack(alignment: .trailing) {
                        if showPassword {
                            TextField("Password", text: $logInViewModel.manager.user.password)
                                .modifier(TextFieldModifier())
                                .focused($inFocus, equals: .plain)
                        } else {
                            SecureField("Password", text: $logInViewModel.manager.user.password)
                                .modifier(TextFieldModifier())
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
                    Text("Login")
                        .modifier(ButtonModifier())
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



