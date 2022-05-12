//
//  PhotoCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 12.05.2022.
//

import UIKit

class PhotoCell: UICollectionViewCell {

    @IBOutlet private weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
    }
    
    public func configure(with image: UIImage) {
        self.image.image = image
    }
}
