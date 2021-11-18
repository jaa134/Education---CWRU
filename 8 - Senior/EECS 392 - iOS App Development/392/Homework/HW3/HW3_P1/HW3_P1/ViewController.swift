//
//  ViewController.swift
//  HW3_P1
//
//  Created by Jacob Alspaw on 2/6/19.
//  Copyright © 2019 Jacob Alspaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainMsg: UILabel!
    
    @IBOutlet weak var label_lower: UILabel!
    @IBOutlet weak var label_upper: UILabel!
    @IBOutlet weak var input_lower: UITextField!
    @IBOutlet weak var input_upper: UITextField!
    
    @IBOutlet weak var btn_search: UIButton!
    
    @IBOutlet weak var label_error: UILabel!
    @IBOutlet weak var label_none: UILabel!
    @IBOutlet weak var label_preview: UILabel!
    @IBOutlet weak var label_answer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        hideAllLabels();
    }

    @IBAction func clicked(_ sender: Any) {
        hideAllLabels();
        
        if (!isValidSearch()) {
            label_error.isHidden = false;
        }
        else {
            let lower = input_lower.text!;
            let upper = input_upper.text!;
            let l = Int(lower)!;
            let u = Int(upper)!;
            
            for i in l...u {
                if (isPerfect(num: i)) {
                    label_answer.text = String(i);
                    label_preview.isHidden = false;
                    label_answer.isHidden = false;
                    return;
                }
            }
            
            label_none.isHidden = false;
        }
    }
    
    private func hideAllLabels() {
        label_error.isHidden = true;
        label_none.isHidden = true;
        label_preview.isHidden = true;
        label_answer.isHidden = true;
    }
    
    private func isValidSearch() -> Bool {
        let lower = Int(input_lower.text!);
        let upper = Int(input_upper.text!);
        return lower != nil
            && upper != nil
            && lower! > 0
            && upper! > 0
            && lower! <= upper!;
    }
    
    private func isPerfect(num: Int) -> Bool {
        var sum = 0;
        for i in 1...Int(Double(num).squareRoot()) {
            if (num % i == 0) {
                sum += i;
                if (num != num / i && i != num / i) {
                    sum += num/i;
                }
            }
        }
        return sum == num;
    }
    
}

