//
//  Data.swift
//  HW7
//
//  Created by Jacob Alspaw on 4/2/19.
//  Copyright © 2019 EECS 345 Group. All rights reserved.
//

import Foundation

class Data {
    public static let singleton = Data()
    
    public var pedigrees: [Pedigree]!
    
    private init() {
        self.pedigrees = [Pedigree]()
        createData()
    }
    
    private func createData() {
        addPedigree1()
        addPedigree2()
        addPedigree3()
    }
    
    private func addPedigree1() {
        let p = Pedigree()
        //parents
        let i0 = Individual(id: 0, first: "Phil", last: "Johnson", gender: true, isDiseased: false, mother: nil, father: nil)
        let i1 = Individual(id: 1, first: "Janet", last: "Johnson", gender: false, isDiseased: true, mother: nil, father: nil)
        //kids
        let i2 = Individual(id: 2, first: "James", last: "Johnson", gender: true, isDiseased: false, mother: i1, father: i0)
        let i3 = Individual(id: 3, first: "Jacob", last: "Johnson", gender: true, isDiseased: true, mother: i1, father: i0)
        let i4 = Individual(id: 4, first: "Josie", last: "Johnson", gender: false, isDiseased: false, mother: i1, father: i0)
        
        p.proband = i0
        p.individuals.append(contentsOf: [ i0, i1, i2, i3, i4 ])
        pedigrees.append(p)
    }
    
    private func addPedigree2() {
        let p = Pedigree()
        
        //grandparents
        let i0 = Individual(id: 0, first: "Ron", last: "Smith", gender: true, isDiseased: true, mother: nil, father: nil)
        let i1 = Individual(id: 1, first: "Debra", last: "Smith", gender: false, isDiseased: true, mother: nil, father: nil)
        //grandparents
        let i2 = Individual(id: 2, first: "John", last: "Doe", gender: true, isDiseased: false, mother: nil, father: nil)
        let i3 = Individual(id: 3, first: "Jane", last: "Doe", gender: false, isDiseased: false, mother: nil, father: nil)
        //parents
        let i4 = Individual(id: 4, first: "Tim", last: "Doe", gender: true, isDiseased: true, mother: i3, father: i2)
        let i5 = Individual(id: 5, first: "Jennifer", last: "Smith", gender: false, isDiseased: false, mother: i1, father: i0)
        //kids
        let i6 = Individual(id: 6, first: "Ellis", last: "Doe", gender: true, isDiseased: true, mother: i5, father: i4)
        let i7 = Individual(id: 7, first: "Elise", last: "Doe", gender: false, isDiseased: false, mother: i5, father: i4)
        
        p.proband = i0
        p.individuals.append(contentsOf: [ i0, i1, i2, i3, i4, i5, i6, i7 ])
        pedigrees.append(p)
    }
    
    private func addPedigree3() {
        let p = Pedigree()
        
        //grandparents
        let i0 = Individual(id: 0, first: "Ben", last: "Franklin", gender: true, isDiseased: true, mother: nil, father: nil)
        let i1 = Individual(id: 1, first: "Judy", last: "Franklin", gender: false, isDiseased: false, mother: nil, father: nil)
        //grandparents' kids
        let i2 = Individual(id: 2, first: "Robert", last: "Franklin", gender: true, isDiseased: false, mother: i1, father: i0)
        let i3 = Individual(id: 3, first: "Bethany", last: "Roosevelt", gender: false, isDiseased: true, mother: i1, father: i0)
        //their spouses
        let i4 = Individual(id: 4, first: "Jacob", last: "Roosevelt", gender: true, isDiseased: true, mother: nil, father: nil)
        let i5 = Individual(id: 5, first: "Jessica", last: "Franklin", gender: false, isDiseased: false, mother: nil, father: nil)
        //their respective kids
        let i6 = Individual(id: 6, first: "Teddy", last: "Franklin", gender: true, isDiseased: false, mother: i5, father: i2)
        let i7 = Individual(id: 7, first: "Georgia", last: "Williams", gender: false, isDiseased: true, mother: i3, father: i4)
        //cousin's spouses
        let i8 = Individual(id: 8, first: "Phillip", last: "Williams", gender: true, isDiseased: false, mother: nil, father: nil)
        let i9 = Individual(id: 9, first: "Patricia", last: "Franklin", gender: false, isDiseased: false, mother: nil, father: nil)
        //cousin's kids
        let i10 = Individual(id: 10, first: "Robert", last: "Williams", gender: true, isDiseased: true, mother: i7, father: i8)
        let i11 = Individual(id: 11, first: "Gertrude", last: "Franklin", gender: false, isDiseased: true, mother: i9, father: i6)
        
        p.proband = i0
        p.individuals.append(contentsOf: [ i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11 ])
        pedigrees.append(p)
    }
}
