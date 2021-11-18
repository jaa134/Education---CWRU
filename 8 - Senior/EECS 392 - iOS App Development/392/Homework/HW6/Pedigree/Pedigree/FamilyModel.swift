//
//  FamilyModel.swift
//  Pedigree
//
//  Created by Jacob Alspaw on 3/4/19.
//  Copyright © 2019 Jacob Alspaw. All rights reserved.
//

import Foundation
import UIKit

class FamilyMember {
    let id: Int;
    let fatherId: Int;
    let motherId: Int;
    let gender: Bool;
    var isAffected: Bool;
    
    init(id: Int, fatherId: Int, motherId: Int, gender: Bool, isAffected: Bool) {
        self.id = id
        self.fatherId = fatherId
        self.motherId = motherId
        self.gender = gender
        self.isAffected = isAffected
    }
    
    func getView() -> UIView {
        //choosing the shape
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        if (gender) {
            view.layer.cornerRadius = view.bounds.size.width / 2.0
            view.clipsToBounds = true
        }
        //setting the color
        view.backgroundColor = isAffected ? UIColor.black : UIColor.white
        return view
    }
}

class FamilyModel {
    
    static let shared = FamilyModel()
    
    var members: [FamilyMember] = [FamilyMember(id: 1, fatherId: 0, motherId: 0, gender: false, isAffected: true),
                                   FamilyMember(id: 2, fatherId: 0, motherId: 0, gender: true, isAffected: false),
                                   FamilyMember(id: 3, fatherId: 0, motherId: 0, gender: false, isAffected: false),
                                   FamilyMember(id: 4, fatherId: 1, motherId: 2, gender: true, isAffected: true),
                                   FamilyMember(id: 5, fatherId: 3, motherId: 4, gender: true, isAffected: true),
                                   FamilyMember(id: 6, fatherId: 3, motherId: 4, gender: false, isAffected: false)]
    
    static func drawPedigreeOntoView(view: UIView) {
        connectMembers(view: view)
        placeMembers(view: view)
    }
    
    private static func placeMembers(view: UIView) {
        let v_m1 = shared.members[0].getView();
        v_m1.frame = v_m1.frame.offsetBy(dx: 40, dy: 60)
        view.addSubview(v_m1)
        
        let v_m2 = shared.members[1].getView();
        v_m2.frame = v_m2.frame.offsetBy(dx: 170, dy: 60)
        view.addSubview(v_m2)
        
        let v_m3 = shared.members[2].getView();
        v_m3.frame = v_m3.frame.offsetBy(dx: 235, dy: 150)
        view.addSubview(v_m3)
        
        let v_m4 = shared.members[3].getView();
        v_m4.frame = v_m4.frame.offsetBy(dx: 105, dy: 150)
        view.addSubview(v_m4)
        
        let v_m5 = shared.members[4].getView();
        v_m5.frame = v_m5.frame.offsetBy(dx: 105, dy: 240)
        view.addSubview(v_m5)
        
        let v_m6 = shared.members[5].getView();
        v_m6.frame = v_m6.frame.offsetBy(dx: 235, dy: 240)
        view.addSubview(v_m6)
    }
    
    private static func connectMembers(view: UIView) {
        let connects_m1_m2 = UIView(frame: CGRect(x: 65, y: 85, width: 130, height: 2))
        connects_m1_m2.backgroundColor = UIColor.black
        view.addSubview(connects_m1_m2)
        
        let connects_m1m2_m4 = UIView(frame: CGRect(x: 130, y: 85, width: 2, height: 90))
        connects_m1m2_m4.backgroundColor = UIColor.black
        view.addSubview(connects_m1m2_m4)
        
        let connects_m3_m4 = UIView(frame: CGRect(x: 130, y: 175, width: 130, height: 2))
        connects_m3_m4.backgroundColor = UIColor.black
        view.addSubview(connects_m3_m4)
        
        let connects_m3m4_m5m6 = UIView(frame: CGRect(x: 195, y: 175, width: 2, height: 45))
        connects_m3m4_m5m6.backgroundColor = UIColor.black
        view.addSubview(connects_m3m4_m5m6)
        
        let connects_m5_m6 = UIView(frame: CGRect(x: 130, y: 220, width: 130, height: 2))
        connects_m5_m6.backgroundColor = UIColor.black
        view.addSubview(connects_m5_m6)
        
        let connects_m3m4_m5 = UIView(frame: CGRect(x: 130, y: 220, width: 2, height: 45))
        connects_m3m4_m5.backgroundColor = UIColor.black
        view.addSubview(connects_m3m4_m5)
        
        let connects_m3m4_m6 = UIView(frame: CGRect(x: 260, y: 220, width: 2, height: 45))
        connects_m3m4_m6.backgroundColor = UIColor.black
        view.addSubview(connects_m3m4_m6)
    }
}
