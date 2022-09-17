//
//  App+Enum.swift
//  EmployeeDirectory
//
//  Created by YADU MADHAVAN on 17/09/22.
//

import Foundation
import UIKit

enum SegueIdentifiers: String {
    case showEmployeeDetails = "showEmployeeDetails"
}

enum ImagePlaceholder {
    case userImage
    
    var image: UIImage {
        get {
            return UIImage(named: "userPlaceholder")!
        }
    }
}
