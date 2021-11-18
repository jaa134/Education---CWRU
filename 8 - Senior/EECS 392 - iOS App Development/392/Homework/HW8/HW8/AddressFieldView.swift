//
//  AddressFieldView.swift
//  HW8
//
//  Created by Jacob Alspaw on 4/17/19.
//  Copyright © 2019 EECS 345 Group. All rights reserved.
//

import Foundation
import UIKit

class AddressFieldView: UITextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 15, dy: 0);
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 15, dy: 0);
    }
    
}
