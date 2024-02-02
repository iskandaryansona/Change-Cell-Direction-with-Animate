//
//  UIView + Extension.swift
//  TestApp
//
//  Created by Sona on 01.02.24.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get{ return self.cornerRadius}
        set {self.layer.cornerRadius = newValue}
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get{ return self.borderWidth}
        set {self.layer.borderWidth = newValue}
    }
    
    @IBInspectable var borderColor: CGColor {
        get{ return self.borderColor}
        set {self.layer.borderColor = newValue}
    }
}

