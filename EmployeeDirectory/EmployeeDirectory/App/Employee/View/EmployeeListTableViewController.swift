//
//  EmployeeListTableViewController.swift
//  EmployeeDirectory
//
//  Created by YADU MADHAVAN on 17/09/22.
//

import UIKit

class EmployeeListTableViewController: UITableViewController {
    
    // MARK: - outlets
    @IBOutlet var searchBar: UISearchBar!
    
    // MARK: - properties
    lazy var employeeViewModel = EmployeeViewModel()
    
    // MARK: - life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setData()
    }
    
    // MARK: - custom methods
    func setData() {
        self.employeeViewModel.employeeViewModelDelegate = self
        self.searchBar.delegate = self
        if self.employeeViewModel.validateData() {
            self.employeeViewModel.fetchEmployeeDataFromServer()
        } else {
            self.employeeViewModel.fetchEmployeeDataFromLocal()
        }
    }
}

// MARK: - Table view data source and delegates methods
extension EmployeeListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.employeeViewModel.employeeManagedData?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeListTableViewCell.reuseIdentifier, for: indexPath) as? EmployeeListTableViewCell {
            cell.configure(employeeDetailsManagedData: self.employeeViewModel.employeeManagedData?[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: SegueIdentifiers.showEmployeeDetails.rawValue, sender: indexPath)
    }
}

// MARK: - Navigation
extension EmployeeListTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifiers.showEmployeeDetails.rawValue {
            if let destination = segue.destination as? EmployeeDetailTableViewController, let indexpath = sender as? IndexPath {
                destination.employeeDetailsManagedData = self.employeeViewModel.employeeManagedData?[indexpath.row]
            }
        }
    }
}

// MARK: - Employee View Model Delegate methods
extension EmployeeListTableViewController: EmployeeViewModelDelegate {
    func employeeDataLoaded() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - Search bar delegate methods
extension EmployeeListTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            self.employeeViewModel.searchKeyWordForManagedData = searchText
        } else {
            self.employeeViewModel.searchKeyWordForManagedData = ""
        }
    }
}
