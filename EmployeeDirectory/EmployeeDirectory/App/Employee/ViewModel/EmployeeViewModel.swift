//
//  EmployeeViewModel.swift
//  EmployeeDirectory
//
//  Created by YADU MADHAVAN on 17/09/22.
//

import Foundation
import UIKit
import CoreData

protocol EmployeeViewModelDelegate: AnyObject {
    func employeeDataLoaded()
}

class EmployeeViewModel {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    weak var employeeViewModelDelegate: EmployeeViewModelDelegate?
    
    var employeeManagedData: [Employee]?
    
    var searchKeyWordForManagedData = "" {
        willSet {
            self.fetchEmployeeDataFromLocal()
        }
    }
    
    func fetchEmployeeDataFromServer() {
        let Url = String(format: baseUrl + getEmployeePath)
        guard let serviceUrl = URL(string: Url) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "GET"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, _, error) in
            //                if let response = response {
            //                    print(response)
            //                }
            if let data = data {
                do {
                    let fetchData = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! NSArray
                    for eachData in fetchData {
                        let eachdataitem = eachData as! [String : Any]
                        let id = eachdataitem["id"] as? Int64 ?? 0
                        let name = eachdataitem["name"] as? String ?? ""
                        let username = eachdataitem["username"] as? String ?? ""
                        let email = eachdataitem["email"] as? String ?? ""
                        let profileImageUrl = eachdataitem["profile_image"] as? String ?? ""
                        let address = eachdataitem["address"] as? NSObject ?? NSObject()
                        let phone = eachdataitem["phone"] as? String ?? ""
                        let website = eachdataitem["website"] as? String ?? ""
                        let company = eachdataitem["company"] as? NSObject ?? NSObject()
                        
                        let employee = Employee(context: self.context)
                        employee.id = id
                        employee.name = name
                        employee.userName = username
                        employee.email = email
                        employee.profileImageUrl = profileImageUrl
                        employee.address = address
                        employee.phone = phone
                        employee.website = website
                        employee.company = company
                        
                        do {
                            try self.context.save()
                        } catch {
                            
                        }
                    }
                    self.fetchEmployeeDataFromLocal()
                } catch {
                }
            }
        }.resume()
    }
    
    func validateData() -> Bool {
        let fetchRequest = Employee.fetchRequest()
        do {
            let count = try self.context.count(for: fetchRequest)
            return count == 0 ? true : false
        } catch {
            print(error.localizedDescription)
        }
        return false
    }
    
    func fetchEmployeeDataFromLocal() {
        do {
            let request = Employee.fetchRequest() as NSFetchRequest<Employee>
            if self.searchKeyWordForManagedData != "" {
                let predicate = NSPredicate(format: "name CONTAINS[c] %@ || email CONTAINS[c] %@", argumentArray: [self.searchKeyWordForManagedData, self.searchKeyWordForManagedData])
                request.predicate = predicate
            }
            self.employeeManagedData = try context.fetch(request)
            self.employeeViewModelDelegate?.employeeDataLoaded()
        } catch {
            print(error.localizedDescription)
        }
    }
}
