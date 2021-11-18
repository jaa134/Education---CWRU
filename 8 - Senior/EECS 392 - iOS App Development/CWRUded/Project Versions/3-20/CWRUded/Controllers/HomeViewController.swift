//
//  HomeViewController.swift
//  CWRUded
//
//  Created by Jacob Alspaw on 3/19/19.
//  Copyright © 2019 Jacob Alspaw. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var academicButton: UIButton!
    @IBOutlet weak var diningButton: UIButton!
    @IBOutlet weak var gymButton: UIButton!
    @IBOutlet weak var showAllButton: UIButton!
    
    private var selectedFilterButton: UIButton?
    private let normalBackgroundColor = UIColor(red: 10/255.0, green: 48/255.0, blue: 78/255.0, alpha: 1)
    private let heldBackgroundColor = UIColor(red: 130/255.0, green: 130/255.0, blue: 130/255.0, alpha: 1)
    private let selectedBackgroundColor = UIColor(red: 100/255.0, green: 100/255.0, blue: 100/255.0, alpha: 1)
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addFilterButtonIcons()
        roundFilterButtons()
        selectInitialButton(button: showAllButton)
        addContentToScrollView()
    }
    
    func addFilterButtonIcons() {
        academicButton.titleLabel?.font = UIFont(name: "FontAwesome5Free-Solid", size: 35)
        diningButton.titleLabel?.font = UIFont(name: "FontAwesome5Free-Solid", size: 35)
        gymButton.titleLabel?.font = UIFont(name: "FontAwesome5Free-Solid", size: 35)
        
        academicButton.setTitle("\u{f02d}", for: .normal)
        diningButton.setTitle("\u{f2e7}", for: .normal)
        gymButton.setTitle("\u{f44b}", for: .normal)
        
        academicButton.setTitleColor(UIColor.white, for: .normal)
        diningButton.setTitleColor(UIColor.white, for: .normal)
        gymButton.setTitleColor(UIColor.white, for: .normal)
    }
    
    func roundFilterButtons() {
        academicButton.layer.cornerRadius = 0.5 * academicButton.bounds.size.width
        academicButton.clipsToBounds = true
        diningButton.layer.cornerRadius = 0.5 * diningButton.bounds.size.width
        diningButton.clipsToBounds = true
        gymButton.layer.cornerRadius = 0.5 * gymButton.bounds.size.width
        gymButton.clipsToBounds = true
        showAllButton.layer.cornerRadius = 0.125 * showAllButton.bounds.height
        showAllButton.clipsToBounds = true
    }
    
    func selectInitialButton(button: UIButton) {
        button.backgroundColor = selectedBackgroundColor
        selectedFilterButton = button
    }
    
    func addContentToScrollView() {
        CrowdedData.update()
        let crowdedDataView = CrowdedDataView()
        
        let screensize: CGRect = UIScreen.main.bounds
        let scrollWidth: CGFloat = screensize.width
        let scrollHeight: CGFloat = crowdedDataView.frame.height
        scrollView.contentSize = CGSize(width: scrollWidth, height: scrollHeight)
        
        scrollView.addSubview(crowdedDataView)
    }
    
    func pressButton(button: UIButton) {
        button.backgroundColor = heldBackgroundColor
    }
    
    func animateToColor(button: UIButton?, color: UIColor) {
        if let button = button {
            UIView.transition(with: button, duration: 0.25, options: .curveEaseInOut, animations: {
                button.backgroundColor = color
            })
        }
    }
    
    func selectButton(button: UIButton) {
        if (selectedFilterButton != button) {
            animateToColor(button: selectedFilterButton, color: normalBackgroundColor)
        }
        animateToColor(button: button, color: selectedBackgroundColor)
        selectedFilterButton = button
    }
    
    @IBAction func academicButtonPressedDown(_ sender: Any) {
        pressButton(button: academicButton)
    }
    
    @IBAction func diningButtonPressedDown(_ sender: Any) {
        pressButton(button: diningButton)
    }
    
    @IBAction func gymButtonPressedDown(_ sender: Any) {
        pressButton(button: gymButton)
    }
    
    @IBAction func showAllButtonPressedDown(_ sender: Any) {
        pressButton(button: showAllButton)
    }
    
    @IBAction func academicButtonPressedUpInside(_ sender: Any) {
        selectButton(button: academicButton)
    }
    
    @IBAction func diningButtonPressedUpInside(_ sender: Any) {
        selectButton(button: diningButton)
    }
    
    @IBAction func gymButtonPressedUpInside(_ sender: Any) {
        selectButton(button: gymButton)
    }
    
    @IBAction func showAllButtonPressedUpInside(_ sender: Any) {
        selectButton(button: showAllButton)
    }
    
}

