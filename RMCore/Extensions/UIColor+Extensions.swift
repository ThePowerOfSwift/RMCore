//
//  UIColor+Extensions.swift
//  RMCore
//
//  Created by Ryan Mannion on 4/29/16.
//  Copyright © 2016 Ryan Mannion. All rights reserved.
//

import Foundation

public extension UIColor {
    public convenience init(hex: CLong, alpha: CGFloat = 1) {
        let red = CGFloat((hex >> 16) & 0xff) / 255.0
        let green = CGFloat((hex >> 8) & 0xff) / 255.0
        let blue = CGFloat(hex & 0xff) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public func image() -> UIImage? {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(cgColor)
            context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
            
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image
        }
        
        return nil
    }
}
