//
//  SigninView.swift
//  OnlineShoppee
//
//  Created by anita on 3/10/23.
//

import SwiftUI

struct SigninView: View {
    @EnvironmentObject var session: SessionManager
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var password: String = ""
    
    @StateObject private var manager = RegistrationManager()
    
    
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
                Button {
                    manager.validate()
                    if !manager.hasError {
                        // TODO: Handle registration
                        session.logIn()
                    }
                } label: {
                    ButtonView(buttonText: "Sign in")
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
