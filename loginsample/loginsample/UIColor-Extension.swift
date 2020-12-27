//
//  UIColor-Extension.swift
//  loginsample
//
//  Created by 木元健太郎 on 2020/12/27.
//

import UIKit

extension UIColor {

    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
    
    
}