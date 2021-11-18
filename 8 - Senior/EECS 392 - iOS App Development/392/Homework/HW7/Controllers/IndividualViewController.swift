//
//  IndividualViewController.swift
//  HW7
//
//  Created by Jacob Alspaw on 4/3/19.
//  Copyright © 2019 EECS 345 Group. All rights reserved.
//

import Foundation
import UIKit

class IndividualViewController: UIViewController {
    
    @IBOutlet weak var idLabel: UITextField!
    @IBOutlet weak var firstLabel: UITextField!
    @IBOutlet weak var lastLabel: UITextField!
    @IBOutlet weak var genderSwitch: UISwitch!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var diseaseSwitch: UISwitch!
    @IBOutlet weak var fatherPicker: UIPickerView!
    @IBOutlet weak var motherPicker: UIPickerView!
    
    public var individual: Individual!
    public var pedigree: Pedigree!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupView() {
        idLabel.text = String(individual.id)
        firstLabel.text = individual.first
        firstLabel.backgroundColor = UIColor.white
        lastLabel.text = individual.last
        lastLabel.backgroundColor = UIColor.white
        genderSwitch.setOn(individual.gender, animated: false)
        genderSwitch.addTarget(self, action: #selector(onGenderChanged(sender:)), for: .valueChanged)
        genderLabel.text = genderSwitch.isOn ? "M" : "F"
        diseaseSwitch.setOn(individual.isDiseased, animated: false)
        
        fatherPicker.dataSource = self
        fatherPicker.delegate = self
        motherPicker.dataSource = self
        motherPicker.delegate = self
        
        if (self.individual.father != nil) {
            if let rowF = pedigree.individuals.filter({ i in i.gender == true }).firstIndex(where: { i in i.id == self.individual.father!.id }) {
                fatherPicker.selectRow(rowF + 1, inComponent: 0, animated: false)
            }
        }
        if (self.individual.mother != nil) {
            if let rowM = pedigree.individuals.filter({ i in i.gender == false }).firstIndex(where: { i in i.id == self.individual.mother!.id }) {
                motherPicker.selectRow(rowM + 1, inComponent: 0, animated: false)
            }
        }
    }
    
    @objc func onGenderChanged(sender: UISwitch) {
        genderLabel.text = sender.isOn ? "M" : "F"
    }
    
    @IBAction func onSave(_ sender: Any) {
        let errorColor = UIColor(red: 255/255.0, green: 153/255.0, blue: 153/255.0, alpha: 1)
        let invalidFirst = firstLabel.text == nil || firstLabel.text!.isEmpty
        firstLabel.backgroundColor = invalidFirst ? errorColor : UIColor.white
        let invalidLast = lastLabel.text == nil || lastLabel.text!.isEmpty
        lastLabel.backgroundColor = invalidLast ? errorColor : UIColor.white
        
        if (invalidFirst || invalidLast) {
            return
        }
        
        individual.first = firstLabel.text == nil ? "" : firstLabel.text!
        individual.last = lastLabel.text == nil ? "" : lastLabel.text!
        individual.gender = genderSwitch.isOn
        individual.isDiseased = diseaseSwitch.isOn
        
        let rowF = fatherPicker.selectedRow(inComponent: 0)
        if (rowF == 0) {
            individual.father = nil
        }
        else {
            individual.father = pedigree.individuals.filter({ i in i.gender == true })[rowF - 1]
        }
        
        let rowM = motherPicker.selectedRow(inComponent: 0)
        if (rowM == 0) {
            individual.mother = nil
        }
        else {
            individual.mother = pedigree.individuals.filter({ i in i.gender == false })[rowM - 1]
        }
        
        if (!pedigree.individuals.contains(where: { $0.id == self.individual.id })) {
            pedigree.individuals.append(individual)
        }
        
        showPopup()
    }
    
    private func showPopup() {
        let alert = UIAlertController(title: "Saved!", message: "The pedigree has been updated.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension IndividualViewController: UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == fatherPicker) {
            return pedigree.individuals.filter({ i in i.gender == true }).count + 1
        }
        else {
            return pedigree.individuals.filter({ i in i.gender == false }).count + 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (row == 0) {
            return ""
        }
        
        if (pickerView == fatherPicker) {
            return pedigree.individuals.filter({ i in i.gender == true })[row - 1].name
        }
        else {
            return pedigree.individuals.filter({ i in i.gender == false })[row - 1].name
        }
    }
}
