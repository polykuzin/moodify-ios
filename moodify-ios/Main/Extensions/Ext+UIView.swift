//
//  Ext+UIView.swift
//  moodify-ios
//
//  Created by polykuzin on 07/03/2022.
//

import UIKit

public extension UIView {
    
    class func loadFromNib<T: UIView>() throws -> T {
        guard
            let view = Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as? T
        else { throw NSError(domain: "ru.polykuzin.common", code: 0) }
        return view
    }
}
