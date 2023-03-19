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
    
   private let userStorage = UserStorage()
    
    func validateLogin() {
        if user.email.isEmpty && user.password.isEmpty  {
            hasError = user.email.isEmpty && user.password.isEmpty
            error = user.email.isEmpty && user.password.isEmpty ? .emptyAllFields : nil
        }
        else  if user.email.isEmpty {
              hasError = user.email.isEmpty
              error = user.email.isEmpty ? .emptyEmail : nil
          }
        else if user.password.isEmpty {
            hasError = user.password.isEmpty
            error = user.password.isEmpty ? .emptyPassword : nil
        }
        else if userStorage.validateUser(firstName: user.email, password: user.password) == false  {
            hasError = !userStorage.validateUser(firstName: user.email, password: user.password)
            error = !userStorage.validateUser(firstName: user.email, password: user.password) ? .userDoNotExist : nil
        }
    }
    
    func validateSignUp() {
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
        
        else if userStorage.validateUser(firstName: user.email, password: user.password) == true  {
            hasError = userStorage.validateUser(firstName: user.email, password: user.password)
            error = userStorage.validateUser(firstName: user.email, password: user.password) ? .userAlreadyExist : nil
        }
        
        
        else if user.password.isEmpty {
            hasError = user.password.isEmpty
            error = user.password.isEmpty ? .emptyPassword : nil
        }
        
        else if isValid(input: user.email) == false {
            hasError = !isValid(input: user.email)
            error = isValid(input: user.email) == false ? .wrongEmailFormat : nil
        }
        
    }
    
    
    
    
    }



// MARK: - Errors

extension RegistrationManager {
    
    enum RegistrationError: LocalizedError {
        case emptyFirstName
        case emptyLastName
        case emptyEmail
        case emptyPassword
        case wrongEmailFormat
        case emptyAllFields
        case userAlreadyExist
        case userDoNotExist
        
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
                return "⁉️ Profile already exist."
            case .emptyPassword:
                return "⛔️ Password is empty"
            case .userDoNotExist:
                return "⁉️ Coudn't find user"
            }
            
        }
    }
}

// MARK: - Private Methods

private extension RegistrationManager {
    
    func isValid(input: String) -> Bool {
       let test = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
         print(test.evaluate(with: input))
       return test.evaluate(with: input)
     }
}
