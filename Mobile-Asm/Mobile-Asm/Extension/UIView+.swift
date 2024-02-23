//
//  UIView+.swift
//  Mobile-Asm
//
//  Created by tran.quang.vu on 23/02/2024.
//

import UIKit

extension UIView {
    
    func roundedUsingWidth() {
        self.rounded(cornerRadius: self.frame.size.width / 2)
    }
    
    func roundedUsingHeight() {
        self.rounded(cornerRadius: self.frame.size.height / 2)
    }
    
    func rounded(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
    
    // MARK: IBInspectable
    @IBInspectable var borderColor: UIColor {
        get {
            let color = self.layer.borderColor ?? UIColor.white.cgColor
            return UIColor(cgColor: color) // not using this property as such
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.rounded(cornerRadius: newValue)
        }
    }
}


