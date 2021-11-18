//
//  LocationView.swift
//  CWRUded
//
//  Created by Jacob Alspaw on 3/20/19.
//  Copyright © 2019 Jacob Alspaw. All rights reserved.
//

import Foundation
import UIKit

class LocationView : UIView {
    fileprivate init(location: Location) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    private func setupView() {
        setSize()
        setColor()
        roundCorners()
        setOptions()
    }
    
    private func setSize() {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        let margin_lr: CGFloat = 10
        let width: CGFloat = screenWidth - (2 * margin_lr)
        frame = CGRect(x: margin_lr, y: 0, width: width, height: 100)
    }
    
    private func setColor() {
        backgroundColor = UIColor(red: 10/255.0, green: 48/255.0, blue: 78/255.0, alpha: 1)
    }
    
    private func roundCorners() {
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    private func setOptions() {
        isHidden = false
        isOpaque = false
        isUserInteractionEnabled = false
    }
}

class CrowdedDataView : UIView {
    private var locationViews: [LocationView]
    
    required init() {
        locationViews = [LocationView]()
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    private func setupView() {
        createChildViews()
        setSize()
        setColor()
        setOptions()
    }
    
    private func createChildViews() {
        for _ in 1...2 {
            locationViews.append(LocationView(location: CrowdedData.singleton.locations[0]))
            locationViews.append(LocationView(location: CrowdedData.singleton.locations[1]))
            locationViews.append(LocationView(location: CrowdedData.singleton.locations[2]))
            locationViews.append(LocationView(location: CrowdedData.singleton.locations[3]))
        }
    }
    
    private func calcHeight() -> CGFloat {
        var height: CGFloat = 0
        for locationView in locationViews {
            height += locationView.frame.height
        }
        let paddingTop: CGFloat = 10
        let paddingBetween: CGFloat = CGFloat(((locationViews.count - 1) * 10))
        let paddingBottom: CGFloat = 10
        height += paddingTop + paddingBetween + paddingBottom
        return height
    }
    
    private func setSize() {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        let height: CGFloat = calcHeight()
        let width: CGFloat = screenWidth
        frame = CGRect(x: 0, y: 0, width: width, height: height)
    }
    
    private func setColor() {
        backgroundColor = UIColor(white: 1, alpha: 1)
    }
    
    private func setOptions() {
        isHidden = false
        isOpaque = false
        isUserInteractionEnabled = false
    }
}
