//
//  Pedigree.swift
//  HW7
//
//  Created by Jacob Alspaw on 4/2/19.
//  Copyright © 2019 EECS 345 Group. All rights reserved.
//

import Foundation

class Pedigree {
    public var proband: Individual!
    public var individuals: [Individual]!
    
    public init() {
        proband = nil
        self.individuals = [Individual]()
    }
}
