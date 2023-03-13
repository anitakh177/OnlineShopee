//
//  UserStorage.swift
//  OnlineShoppee
//
//  Created by anita on 3/12/23.
//

import Foundation
import CoreData

class UserStorage: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedEntities: [UserEntity] = []
    @Published var hasError = false
    @Published var error: UserStorageError?
   
    init() {
        container = NSPersistentContainer(name: "UserModel")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loadind core data \(error)")
            } else {
                print("Successfully loaded core data")
            }
        }
        fetchUsers()
    }
    func fetchUsers() {
        let request = NSFetchRequest<UserEntity>(entityName: "UserEntity")
        do {
           savedEntities = try container.viewContext.fetch(request)
        
        } catch let error {
            print("Error fetching \(error.localizedDescription)")
        }
        
    }
    
    func addUser(user: User) {
        let newUser = UserEntity(context: container.viewContext)
        newUser.firstName = user.firstName
        newUser.lastName = user.lastName
        newUser.email = user.email
        newUser.password = user.password
        
        saveData()
        
        
    }
    
    func saveData() {
        do {
          try  container.viewContext.save()
            fetchUsers()
        } catch let error {
            print("Error saving \(error.localizedDescription)")
        }
      
    }
    
    func validateUser(firstName: String, password: String) {
       
        hasError = savedEntities.first(where: { $0.email == firstName && $0.password == password}) != nil
        error = savedEntities.first(where: { $0.email == firstName && $0.password == password}) != nil ? .userAlreadyExist : nil
    }
    
    func userEmpty(firstName: String, password: String) {
        hasError = savedEntities.first(where: { $0.email == firstName && $0.password == password}) == nil
        error = savedEntities.first(where: { $0.email == firstName && $0.password == password}) == nil ? .userNotExist : nil
    }
    
    
}

extension UserStorage {
    
    enum UserStorageError: LocalizedError {
        case userAlreadyExist
        case userNotExist
        
        var errorDescription: String? {
            switch self {
            case .userAlreadyExist:
                return "Yur profile already exist."
            case .userNotExist:
                return "Coudn't find user"
            }
            
        }
    }
}
