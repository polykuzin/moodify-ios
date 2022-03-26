//
//  FirstStepCollectionCell.swift
//  moodify-ios
//
//  Created by polykuzin on 26/03/2022.
//

import UIKit

protocol _Step {
    var title : String { get }
    var descr : String { get }
    var image : UIImage { get }
}

final class OnBoardingCollectionCell : UICollectionViewCell {
    
    public func configure(with data: _Step) {
        title.text = data.title
        descr.text = data.descr
        image.image = data.image
    }
    
    @IBOutlet private weak var title : UILabel!
    
    @IBOutlet private weak var descr : UILabel!
    
    @IBOutlet private weak var image : UIImageView!
}
