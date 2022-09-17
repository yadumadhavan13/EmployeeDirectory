//
//  UIView+Extensions.swift
//  EmployeeDirectory
//
//  Created by YADU MADHAVAN on 17/09/22.
//

import Foundation
import UIKit

extension UIView {
    func rounded() {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.borderWidth = 1
    }
}

