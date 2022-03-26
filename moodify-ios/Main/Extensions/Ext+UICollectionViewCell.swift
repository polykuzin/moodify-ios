//
//  Ext+UICollectionViewCell.swift
//  moodify-ios
//
//  Created by polykuzin on 26/03/2022.
//

import UIKit

extension UICollectionViewCell {
    
    static var nib : UINib{
        return UINib(nibName: reuseId, bundle: nil)
    }
    
    static var reuseId : String{
        return String(describing: self)
    }
}
