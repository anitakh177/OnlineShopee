//
//  UserEntity+CoreDataProperties.swift
//  OnlineShoppee
//
//  Created by anita on 3/12/23.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var password: String?

}

extension UserEntity : Identifiable {

}
