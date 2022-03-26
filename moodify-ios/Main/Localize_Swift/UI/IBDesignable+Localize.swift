//
//  IBDesignable+Localize1.swift
//  Localize-Swift
//
//  Copyright © 2020 Roy Marmelstein. All rights reserved.
//

import UIKit

@IBDesignable public extension UILabel {
    
    @IBInspectable var localizeKey: String? {
        set {
            DispatchQueue.main.async {
                self.text = newValue?.localized()
            }
        }
        get {
            return self.text
        }
    }
}

@IBDesignable public extension UIButton {

    @IBInspectable var localizeKey: String? {
        set {
            DispatchQueue.main.async {
                self.setTitle(newValue?.localized(), for: .normal)
            }
        }
        get {
            return self.titleLabel?.text
        }
    }
}

@IBDesignable public extension UITextView {

    @IBInspectable var localizeKey: String? {
        set {
            // set new value from dictionary
            DispatchQueue.main.async {
                self.text = newValue?.localized()
            }
        }
        get {
            return self.text
        }
    }
}

@IBDesignable public extension UITextField {
    @IBInspectable var localizeKey: String? {
        set {
            // set new value from dictionary
            DispatchQueue.main.async {
                self.placeholder = newValue?.localized()
            }
        }
        get {
            return self.placeholder
        }
    }
}

@IBDesignable public extension UINavigationItem {

    @IBInspectable var localizeKey: String? {
        set {
            // set new value from dictionary
            DispatchQueue.main.async {
                self.title = newValue?.localized()
            }
        }
        get {
            return self.title
        }
    }
}
