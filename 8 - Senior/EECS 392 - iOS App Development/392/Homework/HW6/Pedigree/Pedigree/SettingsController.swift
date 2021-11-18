//
//  ViewController.swift
//  Pedigree
//
//  Created by Jacob Alspaw on 3/4/19.
//  Copyright © 2019 Jacob Alspaw. All rights reserved.
//

import UIKit

class SettingsController: UIViewController, IReload {
    
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    @IBOutlet weak var switch3: UISwitch!
    @IBOutlet weak var switch4: UISwitch!
    @IBOutlet weak var switch5: UISwitch!
    @IBOutlet weak var switch6: UISwitch!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reload()
    }
    
    func reload() {
        switch1.isOn = FamilyModel.shared.members[0].isAffected
        switch2.isOn = FamilyModel.shared.members[1].isAffected
        switch3.isOn = FamilyModel.shared.members[2].isAffected
        switch4.isOn = FamilyModel.shared.members[3].isAffected
        switch5.isOn = FamilyModel.shared.members[4].isAffected
        switch6.isOn = FamilyModel.shared.members[5].isAffected
    }
    
    @IBAction func onSwitch1(_ sender: Any) {
        FamilyModel.shared.members[0].isAffected = switch1.isOn
    }
    @IBAction func onSwitch2(_ sender: Any) {
        FamilyModel.shared.members[1].isAffected = switch2.isOn
    }
    @IBAction func onSwitch3(_ sender: Any) {
        FamilyModel.shared.members[2].isAffected = switch3.isOn
    }
    @IBAction func onSwitch4(_ sender: Any) {
        FamilyModel.shared.members[3].isAffected = switch4.isOn
    }
    @IBAction func onSwitch5(_ sender: Any) {
        FamilyModel.shared.members[4].isAffected = switch5.isOn
    }
    @IBAction func onSwitch6(_ sender: Any) {
        FamilyModel.shared.members[5].isAffected = switch6.isOn
    }
}

