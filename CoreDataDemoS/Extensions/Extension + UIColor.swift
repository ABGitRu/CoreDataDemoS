//
//  Extension + UIColor.swift
//  CoreDataDemoS
//
//  Created by Mac on 11.05.2021.
//

import UIKit

extension UIColor {
    
    convenience init(r: Int, g: Int, b: Int, a: CGFloat = 1) {
        self.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: a)
    }
    
    convenience init(gray: Int, alpha: CGFloat) {
        self.init(red: CGFloat(gray)/255, green: CGFloat(gray)/255, blue: CGFloat(gray)/255, alpha: alpha)
    }
    
}
