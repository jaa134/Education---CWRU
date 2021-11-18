//
//  ViewController.swift
//  PhoneInterface
//
//  Created by Jing Li on 1/28/19.
//  Copyright © 2019 Jing Li. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var _phoneNumber: String = "";
    @IBOutlet weak var phoneNumber: UILabel!
    
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var hangupButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        callButton.isEnabled = false
        hangupButton.isEnabled = false
        deleteButton.isEnabled = false
    }
    
    func isValidNumber() -> Bool {
        let containsOnlyNums = CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: _phoneNumber));
        return _phoneNumber.count == 10 && containsOnlyNums;
    }
    
    func formattedNumber() -> String {
        let startIndex = _phoneNumber.startIndex;
        return String(format: "(%@)%@-%@",
                      String(_phoneNumber[startIndex..._phoneNumber.index(startIndex, offsetBy: 2)]),
                      String(_phoneNumber[_phoneNumber.index(startIndex, offsetBy: 3)..._phoneNumber.index(startIndex, offsetBy: 5)]),
                      String(_phoneNumber[_phoneNumber.index(startIndex, offsetBy: 6)..._phoneNumber.index(startIndex, offsetBy: 9)]));
    }
    
    @IBAction func DigitPressed(_ sender: UIButton) {
        _phoneNumber = _phoneNumber + sender.currentTitle!;
        
        deleteButton.isEnabled = _phoneNumber.count > 0;
        
        if (isValidNumber()) {
            phoneNumber.text = formattedNumber();
            callButton.isEnabled = true;
        }
        else {
            phoneNumber.text = _phoneNumber;
            callButton.isEnabled = false;
        }
    }
    
    @IBAction func callButtonPressed(_ sender: UIButton) {
        if (isValidNumber()) {
            phoneNumber.text = "call initiated...";
            callButton.isEnabled = false;
            hangupButton.isEnabled = true;
            deleteButton.isEnabled = false;
        }
    }
    
    @IBAction func hangupButtonPressed(_ sender: UIButton) {
        if (isValidNumber()) {
            _phoneNumber = "";
            phoneNumber.text = "";
            hangupButton.isEnabled = false;
            deleteButton.isEnabled = false;
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        _phoneNumber.removeLast();
        if (isValidNumber()) {
            phoneNumber.text = formattedNumber();
            callButton.isEnabled = true;
        }
        else {
            phoneNumber.text = _phoneNumber;
            callButton.isEnabled = false;
        }
        deleteButton.isEnabled = _phoneNumber.count > 0;
    }
}

