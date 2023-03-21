//
//  UserStorage.swift
//  OnlineShoppee
//
//  Created by anita on 3/12/23.
//

import Foundation
import CoreData

class UserStorage: ObservableObject {
    static let shared = UserStorage()
    
    let container: NSPersistentContainer
    @Published var savedEntities: [UserEntity] = []
   
   
   private init() {
        container = NSPersistentContainer(name: "UserModel")
        container.loadPersistentStores { description, error in
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
    
    func validateUser(firstName: String, password: String) -> Bool {
        return savedEntities.first(where: { $0.email == firstName && $0.password == password}) != nil
    }
    
    
}
