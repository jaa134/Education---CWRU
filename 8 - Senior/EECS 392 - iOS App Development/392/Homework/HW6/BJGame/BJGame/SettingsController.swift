//
//  ViewController.swift
//  BJGame
//
//  Created by Jing Li on 2/4/19.
//  Copyright © 2019 Jing Li. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
    
    @IBOutlet weak var TopRightButton: UIBarButtonItem!
    @IBOutlet weak var TopLeftButton: UIBarButtonItem!
    @IBOutlet weak var numDecksInput: UITextField!
    @IBOutlet weak var thresholdInput: UITextField!
    @IBOutlet weak var numDecksLabel: UILabel!
    @IBOutlet weak var thresholdLabel: UILabel!
    
    public var settings: Settings
    private var isInEdit: Bool
    
    required init?(coder aDecoder: NSCoder) {
        self.isInEdit = false
        self.settings = Settings()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        self.numDecksInput.text = String(settings.numDecks)
        self.thresholdInput.text = String(settings.threshold)
        numDecksInput.isEnabled = false
        thresholdInput.isEnabled = false
    }
    
    @IBAction func NavLeftButtonPressed(_ sender: Any) {
    }
    
    @IBAction func NavRightButtonPressed(_ sender: Any) {
        if (!isInEdit) {
            self.isInEdit = true
            numDecksInput.isEnabled = true
            thresholdInput.isEnabled = true
            TopRightButton.title = "Done"
        }
        else {
            let numDecks: Int? = Int(numDecksInput.text!);
            let threshold: Int? = Int(thresholdInput.text!);
            
            let isNumDecksValid = numDecks != nil && numDecks! >= settings.minNumDecks;
            let isThresholdValid = threshold != nil && threshold! >= settings.minThreshold;
            numDecksLabel.textColor = isNumDecksValid ? UIColor.black : UIColor.red
            thresholdLabel.textColor = isThresholdValid ? UIColor.black : UIColor.red
            if (!isNumDecksValid || !isThresholdValid) {
                return
            }
            performSegue(withIdentifier: "toGame", sender: sender)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let bjViewController = segue.destination as? BJViewController {
            let numDecks = Int(numDecksInput.text!)
            let threshold = Int(thresholdInput.text!)
            bjViewController.settings = Settings(numDecks: numDecks, threshold: threshold)
        }
    }
}

