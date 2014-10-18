//
//  ViewController.swift
//  CGRaw
//
//  Created by Collin Ruffenach on 9/12/14.
//  Copyright (c) 2014 Notion. All rights reserved.
//

import UIKit

class ColorView : UIView {
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let rawBounds = CGRaw.rawRect(uiKitRect: self.bounds)
        for i in 0...Int(CGRectGetWidth(rawBounds)) {
            for j in 0...Int(CGRectGetHeight(rawBounds)) {
                let modi : Bool = (i % 2 == 1)
                let modj : Bool = (j % 2 == 1)
                let hue : CGFloat = CGFloat(i)/CGRectGetWidth(rawBounds)
//                let color = UIColor(
//                    hue: CGFloat(j)/CGRectGetHeight(rawBounds),
//                    saturation: CGFloat(i)/CGRectGetWidth(rawBounds),
//                    brightness: CGFloat((i+j))/(CGRectGetWidth(rawBounds)+CGRectGetHeight(rawBounds)),
//                    alpha: CGFloat(1.0))
                let random : () -> CGFloat = {
                    return CGFloat((CGFloat(arc4random()) % 100.0)/100.0)
                }
                let color = UIColor (
                    hue: random(),
                    saturation: random(),
                    brightness: random(),
                    alpha: random()
                )
                color.setFill()
                UIRectFill(CGRaw.uiKitRect(
                    rawRect: CGRect(
                        x: i,
                        y: j,
                        width: 1,
                        height: 1
                    )
                    )
                )
            }
        }
    }
}

class ViewController: UIViewController {
    
    var colorView = ColorView()

    override func viewWillLayoutSubviews() {
        
        if self.colorView.superview == nil {
            self.view.addSubview(self.colorView)
        }

        self.colorView.frame = self.view.bounds
    }
}