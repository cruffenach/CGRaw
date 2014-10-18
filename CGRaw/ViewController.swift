//
//  ViewController.swift
//  CGRaw
//
//  Created by Collin Ruffenach on 9/12/14.
//  Copyright (c) 2014 Notion. All rights reserved.
//

import UIKit

struct CGRaw {
    
    static func rawRect(#uiKitRect : CGRect) -> CGRect {
        let scale = UIScreen.mainScreen().scale
        return CGRect(
            x: CGRectGetMinX(uiKitRect)*scale,
            y: CGRectGetMinY(uiKitRect)*scale,
            width: CGRectGetWidth(uiKitRect)*scale,
            height: CGRectGetHeight(uiKitRect)*scale
        )
    }

    static func uiKitRect(#rawRect : CGRect) -> CGRect {
        let scale = UIScreen.mainScreen().scale
        return CGRect(
            x : CGRectGetMinX(rawRect)/scale,
            y : CGRectGetMinY(rawRect)/scale,
            width : CGRectGetWidth(rawRect)/scale,
            height : CGRectGetHeight(rawRect)/scale
        )
    }

    static func rawMainScreenScreenBounds() -> CGRect {
        return rawRect(uiKitRect: UIScreen.mainScreen().bounds)
    }
    
    var rawRect = CGRectZero
    var uiKitRect : CGRect {
        get { return CGRaw.uiKitRect(rawRect: self.rawRect) }
        set { rawRect = CGRaw.rawRect(uiKitRect: newValue) }
    }
}

extension CGRect {
    var rawRect : CGRect {
        get { return CGRaw.rawRect(uiKitRect: self) }
        set { self = CGRaw.uiKitRect(rawRect: newValue) }
    }
}

class ColorView : UIView {
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let rawBounds = CGRaw.rawRect(uiKitRect: self.bounds)
        for i in 0...Int(CGRectGetWidth(rawBounds)) {
            for j in 0...Int(CGRectGetHeight(rawBounds)) {
                let modi : Bool = (i % 2 == 1)
                let modj : Bool = (j % 2 == 1)
                let hue : CGFloat = CGFloat(i)/CGRectGetWidth(rawBounds)
                let color = UIColor(
                    hue: CGFloat(j)/CGRectGetHeight(rawBounds),
                    saturation: CGFloat(i)/CGRectGetWidth(rawBounds),
                    brightness: CGFloat((i+j))/(CGRectGetWidth(rawBounds)+CGRectGetHeight(rawBounds)),
                    alpha: CGFloat(1.0))
//                let random : () -> CGFloat = {
//                    return CGFloat((CGFloat(arc4random()) % 100.0)/100.0)
//                }
//                let color = UIColor (
//                    hue: random(),
//                    saturation: random(),
//                    brightness: random(),
//                    alpha: random()
//                )
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