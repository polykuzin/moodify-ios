//
//  FourthStepOnboardingCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 01.07.2022.
//

import UIKit

protocol _FourthStep: _Step {
    var title: String { get }
    var description: String { get }
}

class FourthStepOnboardingCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with data: _FourthStep) {
        
    }
}
