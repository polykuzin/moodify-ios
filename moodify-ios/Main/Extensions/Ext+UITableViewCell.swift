//
//  Ext+UITableViewCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 24.04.2022.
//

import UIKit

public extension UITableViewCell {
    
    static var nib  : UINib {
        return UINib(nibName: identifire, bundle: nil)
    }
    
    static var identifire : String {
        return String(describing: self)
    }
}
