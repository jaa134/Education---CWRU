//
//  MemberCell.swift
//  HW7
//
//  Created by Jacob Alspaw on 4/3/19.
//  Copyright © 2019 EECS 345 Group. All rights reserved.
//

import Foundation
import UIKit

class MemberCell : UITableViewCell {
    public static let height: CGFloat = 66;
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fatherLabel: UILabel!
    @IBOutlet weak var motherLabel: UILabel!
    
    public private(set) var individual: Individual!
    
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
    
    public func setupView(individual: Individual) {
        self.individual = individual
        self.nameLabel.text = individual.name
        
        if let father = individual.father {
            self.fatherLabel.text = father.name
            self.fatherLabel.textColor = UIColor.black
        }
        else {
            self.fatherLabel.text = "unknown"
            self.fatherLabel.textColor = UIColor.gray
        }
        
        if let mother = individual.mother {
            self.motherLabel.text = mother.name
            self.motherLabel.textColor = UIColor.black
        }
        else {
            self.motherLabel.text = "unknown"
            self.motherLabel.textColor = UIColor.gray
        }
    }
}
