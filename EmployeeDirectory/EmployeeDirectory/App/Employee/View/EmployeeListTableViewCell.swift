//
//  EmployeeListTableViewCell.swift
//  EmployeeDirectory
//
//  Created by YADU MADHAVAN on 17/09/22.
//

import UIKit
import Kingfisher

class EmployeeListTableViewCell: UITableViewCell {
    
    static var reuseIdentifier: String = String(describing: EmployeeListTableViewCell.self)
    
    @IBOutlet var userProfileImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var userCompanyNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.userProfileImageView.rounded()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(employeeDetailsManagedData: Employee?) {
        self.userNameLabel.text = employeeDetailsManagedData?.name ?? ""
        self.userCompanyNameLabel.text = employeeDetailsManagedData?.companyName ?? ""
        self.userCompanyNameLabel.isHidden = employeeDetailsManagedData?.companyName ?? "" == ""
        if employeeDetailsManagedData?.profileImageUrl ?? "" != "" {
            self.userProfileImageView.kf.setImage(with: URL(string: employeeDetailsManagedData?.profileImageUrl ?? ""))
        } else {
            self.userProfileImageView.image = ImagePlaceholder.userImage.image
        }
    }
}
