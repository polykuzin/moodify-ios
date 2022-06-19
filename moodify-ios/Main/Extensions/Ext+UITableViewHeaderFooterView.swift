//
//  Ext+UITableViewHeaderFooterView.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 19.06.2022.
//

import UIKit

public extension UITableViewHeaderFooterView {

    static var nib  : UINib {
        return UINib(nibName: identifire, bundle: nil)
    }

    static var identifire : String {
        return String(describing: self)
    }
}
