//
//  CGRaw.swift
//  CGRaw
//
//  Created by Collin Ruffenach on 10/18/14.
//  Copyright (c) 2014 Notion. All rights reserved.
//

import Foundation
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