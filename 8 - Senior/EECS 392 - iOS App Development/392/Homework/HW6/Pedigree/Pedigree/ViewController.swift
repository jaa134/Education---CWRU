//
//  ViewController.swift
//  Pedigree
//
//  Created by Jacob Alspaw on 3/4/19.
//  Copyright © 2019 Jacob Alspaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController, IReload {
    
    @IBOutlet weak var pedigreeView: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reload()
    }
    
    func reload() {
        //for subview in view.subviews {
        //    subview.removeFromSuperview()
        //}
        pedigreeView.isUserInteractionEnabled = true
        FamilyModel.drawPedigreeOntoView(view: pedigreeView)
    }
    
    @IBAction func handlePan(sender: UIPanGestureRecognizer) {
        let senderView = sender.view!
        let translation = sender.translation(in: self.view)
        senderView.center = CGPoint(x: senderView.center.x + translation.x, y: senderView.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    @IBAction func handlePinch(sender: UIPinchGestureRecognizer) {
        let senderView = sender.view!
        senderView.transform = senderView.transform.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1
    }
}

