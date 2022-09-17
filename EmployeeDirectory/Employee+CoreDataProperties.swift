//
//  Employee+CoreDataProperties.swift
//  EmployeeDirectory
//
//  Created by YADU MADHAVAN on 17/09/22.
//
//

import Foundation
import CoreData


extension Employee {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }
    
    @NSManaged public var address: NSObject?
    @NSManaged public var company: NSObject?
    @NSManaged public var email: String?
    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var profileImageUrl: String?
    @NSManaged public var userName: String?
    @NSManaged public var website: String?
    
}

extension Employee : Identifiable {
    
}
