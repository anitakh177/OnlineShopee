//
//  PasswordTextFieldView.swift
//  OnlineShoppee
//
//  Created by anita on 3/19/23.
//

import SwiftUI


struct PasswordTextField: View {
    @Binding var user: User
    @State private var showPassword: Bool = false
    @FocusState private var inFocus: Field?
    
    var body: some View {
        VStack(alignment: .trailing) {
            if showPassword {
                TextField("Password", text: $user.password)
                    .modifier(TextFieldModifier())
                    .autocapitalization(.none)
                    .focused($inFocus, equals: .plain)
            } else {
                SecureField("Password", text: $user.password)
                    .modifier(TextFieldModifier())
                    .autocapitalization(.none)
                    .focused($inFocus, equals: .secure)
            }
        }.overlay(alignment: .trailing) {
            Button {
                self.showPassword.toggle()
                inFocus = showPassword ? .plain : .secure
            } label: {
                Image("security")
            }
            .padding(.trailing, 15)
        }
            
            
            
        }
    }

