//
//  SecondStepOnboardingCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 01.07.2022.
//

import UIKit

protocol _SecondStep: _Step {
    var title: String { get }
    var description: String { get }
}

class SecondStepOnboardingCell: UICollectionViewCell {
    
    @IBOutlet private weak var titleView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    public func configure(with data: _SecondStep) {
        self.titleLabel.text = data.title
        self.descriptionLabel.text = data.description
    }
    
    private func setup() {
        self.titleView.layer.cornerRadius = 8
    }
}
