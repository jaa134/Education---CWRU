//
//  PedigreeCell.swift
//  HW7
//
//  Created by Jacob Alspaw on 4/2/19.
//  Copyright © 2019 EECS 345 Group. All rights reserved.
//

import Foundation
import UIKit

class PedigreeCell : UITableViewCell {
    public static let height: CGFloat = 44;
    
    public private(set) var pedigree: Pedigree!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.textLabel?.text = nil
    }
    
    public func setupView(pedigree: Pedigree) {
        self.pedigree = pedigree
        self.textLabel?.text = pedigree.proband.last
    }
}
