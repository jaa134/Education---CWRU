//
//  Individual.swift
//  HW7
//
//  Created by Jacob Alspaw on 4/2/19.
//  Copyright © 2019 EECS 345 Group. All rights reserved.
//

import Foundation

class Individual {
    public var id: Int
    public var first: String
    public var last: String
    public var gender: Bool
    public var isDiseased: Bool
    public var mother: Individual?
    public var father: Individual?
    
    public var name: String { return first + " " + last }
    
    public init(id: Int) {
        self.id = id
        self.first = ""
        self.last = ""
        self.gender = false
        self.isDiseased = false
        self.mother = nil
        self.father = nil
    }
    
    public init(id: Int, first: String, last: String, gender: Bool, isDiseased: Bool, mother: Individual?, father: Individual?) {
        self.id = id
        self.first = first
        self.last = last
        self.gender = gender
        self.isDiseased = isDiseased
        self.mother = mother
        self.father = father
    }
}
