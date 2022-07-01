//
//  ThirdStepOnboardingCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 01.07.2022.
//

import UIKit

protocol _ThirdStep: _Step {
    var title: String { get }
}

class ThirdStepOnboardingCell: UICollectionViewCell {
    
    @IBOutlet private weak var descriptionView: UIView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    public func configure(with data: _ThirdStep) {
        self.descriptionLabel.text = data.description
    }
    
    private func setup() {
        self.descriptionView.layer.cornerRadius = 8
    }
}
