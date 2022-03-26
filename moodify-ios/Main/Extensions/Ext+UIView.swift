//
//  Ext+UIView.swift
//  moodify-ios
//
//  Created by polykuzin on 07/03/2022.
//

import UIKit

public extension UIView {
    
    /**
     Load the view from a nib file called with the name of the class;
      - note: The first object of the nib file **must** be of the matching class
      - parameters:
        - none
     */
    static func loadFromNib() -> Self {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: String(describing: self), bundle: bundle)
        return nib.instantiate(withOwner: nil, options: nil).first as! Self
    }
}
