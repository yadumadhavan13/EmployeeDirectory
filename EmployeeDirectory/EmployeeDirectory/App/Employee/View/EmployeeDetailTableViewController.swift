//
//  EmployeeDetailTableViewController.swift
//  EmployeeDirectory
//
//  Created by YADU MADHAVAN on 17/09/22.
//

import UIKit
import Kingfisher

class EmployeeDetailTableViewController: UITableViewController {
    
    // MARK: - outlets
    @IBOutlet var userProfileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var emailAddressLabel: UILabel!
    @IBOutlet var adressLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var websiteLabel: UILabel!
    @IBOutlet var companyDetailsLabel: UILabel!
    // MARK: - background views
    @IBOutlet var phoneView: UIView!
    @IBOutlet var websiteView: UIView!
    @IBOutlet var companyView: UIView!
    
    // MARK: - properties
    var employeeDetailsManagedData: Employee?
    
    // MARK: - life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setData()
    }
    
    // MARK: - custom methods
    func setData() {
        self.navigationController?.navigationBar.tintColor = .gray
        self.navigationItem.title = self.employeeDetailsManagedData?.name ?? ""
        self.userProfileImageView.rounded()
        self.nameLabel.text = self.employeeDetailsManagedData?.name ?? ""
        self.userNameLabel.text = self.employeeDetailsManagedData?.userName ?? ""
        self.emailAddressLabel.text = self.employeeDetailsManagedData?.email ?? ""
        self.adressLabel.text = self.employeeDetailsManagedData?.addressDetails ?? ""
        self.phoneLabel.text = self.employeeDetailsManagedData?.phone ?? ""
        self.websiteLabel.text = self.employeeDetailsManagedData?.website ?? ""
        self.companyDetailsLabel.text = self.employeeDetailsManagedData?.companyDetails ?? ""
        self.companyView.isHidden = self.employeeDetailsManagedData?.companyName ?? "" == ""
        self.websiteView.isHidden = self.employeeDetailsManagedData?.website ?? "" == ""
        self.phoneView.isHidden = self.employeeDetailsManagedData?.phone ?? "" == ""
        if self.employeeDetailsManagedData?.profileImageUrl ?? "" != "" {
            self.userProfileImageView.kf.setImage(with: URL(string: self.employeeDetailsManagedData?.profileImageUrl ?? ""))
        } else {
            self.userProfileImageView.image = ImagePlaceholder.userImage.image
        }
        self.tableView.reloadData()
    }
}

// MARK: - Table view data source and delegates methods
extension EmployeeDetailTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
