//
//  ViewController.swift
//  BJGame
//
//  Created by Jing Li on 2/4/19.
//  Copyright © 2019 Jing Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck: [Card] = [Card]();
    
    @IBOutlet weak var input_m: UITextField!
    @IBOutlet weak var btn_generate: UIButton!
    @IBOutlet weak var btn_shuffle: UIButton!
    @IBOutlet weak var label_error: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label_error.isHidden = true;
    }

    @IBAction func generate(_ sender: Any) {
        if (!isValidInput()) {
            label_error.isHidden = false;
        }
        else {
            label_error.isHidden = true;
            deck = Card.generateMDecks(m: Int(input_m.text!)!);
            Card.printDeck(cards: deck);
        }
    }
    
    @IBAction func shuffle(_ sender: Any) {
        Card.shuffledCards(cards: &deck);
        Card.printDeck(cards: deck);
    }
    
    private func isValidInput() -> Bool {
        let m = Int(input_m.text!);
        return m != nil && m! > 0;
    }
    
}

