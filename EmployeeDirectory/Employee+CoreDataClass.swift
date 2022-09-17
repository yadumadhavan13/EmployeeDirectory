//
//  Employee+CoreDataClass.swift
//  EmployeeDirectory
//
//  Created by YADU MADHAVAN on 17/09/22.
//
//

import Foundation
import CoreData

@objc(Employee)
public class Employee: NSManagedObject {
    
    var companyDetails: String {
        var companyDetailsString = ""
        if let name = self.company?.value(forKey: "name") {
            companyDetailsString += "\(name)"
        }
        if let catchPhrase = self.company?.value(forKey: "catchPhrase") {
            companyDetailsString += ": \(catchPhrase)"
        }
        if let bs = self.company?.value(forKey: "bs") {
            companyDetailsString += ", \(bs)"
        }
        return companyDetailsString
    }
    
    var companyName: String {
        var companyNameString = ""
        if let name = self.company?.value(forKey: "name") {
            companyNameString += "\(name)"
        }
        return companyNameString
    }
    
    var addressDetails: String {
        var addressDetailString = ""
        if let street = self.address?.value(forKey: "street") {
            addressDetailString += "\(street)"
        }
        if let suite = self.address?.value(forKey: "suite") {
            addressDetailString += ", \(suite)"
        }
        if let city = self.address?.value(forKey: "city") {
            addressDetailString += ", \(city)"
        }
        if let zipcode = self.address?.value(forKey: "zipcode") {
            addressDetailString += ", \(zipcode)"
        }
        return addressDetailString
    }
    
}
