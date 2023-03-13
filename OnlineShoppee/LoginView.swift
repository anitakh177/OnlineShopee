//
//  LoginView.swift
//  OnlineShoppee
//
//  Created by anita on 3/10/23.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var session: SessionManager
    
    @State private var firstName: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    @FocusState var inFocus: Field?
    
    @StateObject var userViewModel = UserStorage()

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
                    TextFieldView(textProp: $firstName, title: "First Name")
                    
                    ZStack(alignment: .trailing) {
                        if showPassword {
                            TextFieldView(textProp: $password, title: "Password")
                                .focused($inFocus, equals: .plain)
                        } else {
                            SecureTextFieldView(textProp: $password, title: "Password")
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
                    userViewModel.userEmpty(firstName: firstName, password: password)
                    if !userViewModel.hasError {
                        withAnimation {
                           
                            session.logIn()
                        }
                    }

                   
                } label: {
                    ButtonView(buttonText: "Login")
                }

                
                 Spacer()
            }
        }
        
        .alert(isPresented: $userViewModel.hasError, error: userViewModel.error) {
            
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(SessionManager())
    }
}



