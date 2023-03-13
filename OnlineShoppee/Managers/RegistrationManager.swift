//
//  RegistrationManager.swift
//  OnlineShoppee
//
//  Created by anita on 3/11/23.
//

import Foundation

final class RegistrationManager: ObservableObject {
    @Published var user = User(firstName: "", lastName: "", email: "", password: "")
    
    @Published var hasError = false
    @Published var error: RegistrationError?
    
 var userViewModel = UserStorage()
    
    // TODO: make validation private in separate function
    
    func validateFirstName() {
        hasError = user.firstName.isEmpty
        error = user.firstName.isEmpty ? .emptyFirstName : nil
    }
    func validateLastName() {
        hasError = user.lastName.isEmpty
        error = user.lastName.isEmpty ? .emptyLastName : nil
    }
    func validateEmail() {
        hasError = user.email.isEmpty
        error = user.email.isEmpty ? .emptyEmail : nil
    }
    func validateEmailFormat() {
       
    }
  
    func validate() {
        if user.firstName.isEmpty && user.lastName.isEmpty && user.email.isEmpty {
            hasError = user.firstName.isEmpty && user.lastName.isEmpty && user.email.isEmpty
            error =  user.firstName.isEmpty && user.lastName.isEmpty && user.email.isEmpty ? .emptyAllFields : nil
        }
      else  if user.firstName.isEmpty {
            hasError = user.firstName.isEmpty
            error = user.firstName.isEmpty ? .emptyFirstName : nil
        }
        else if user.lastName.isEmpty {
            hasError = user.lastName.isEmpty
            error = user.lastName.isEmpty ? .emptyLastName : nil
        }
        else if user.email.isEmpty {
            hasError = user.email.isEmpty
            error = user.email.isEmpty ? .emptyEmail : nil
        }
        
        else if user.email.isValidEmail() {
            hasError = user.email.isValidEmail()
            error = user.email.isValidEmail() ? .wrongEmailFormat : nil
        }
    }
    
   
    
}


   

extension RegistrationManager {
    
    enum RegistrationError: LocalizedError {
        case emptyFirstName
        case emptyLastName
        case emptyEmail
        case wrongEmailFormat
        case emptyAllFields
        case userAlreadyExist
        
        var errorDescription: String? {
            switch self {
            case .emptyFirstName:
                return "⛔️ Fisrt name is empty"
            case .emptyLastName:
                return "⛔️ Last name is empty"
            case .emptyEmail:
                return "⛔️ Email is empty"
            case .wrongEmailFormat:
                return "‼️ Invalid Email"
            case .emptyAllFields:
                return "⛔️ Fields are empty"
            case .userAlreadyExist:
                return "Yur profile already exist."
            }
            
        }
    }
}
