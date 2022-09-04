//
//  BigBarCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 17.07.2022.
//

import UIKit

protocol _BigBar {
    var value: CGFloat { get }
    var weekday: String { get }
}

class BigBarCell: UICollectionViewCell {
    
    private let gradient = CAGradientLayer()

    @IBOutlet private weak var barView: UIView!
    @IBOutlet private weak var weekdayLabel: UILabel!
    @IBOutlet private weak var barHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.gradient.frame = barView.bounds
    }
    
    public func configure(with data: _BigBar) {
        self.weekdayLabel.text = data.weekday
        self.barHeight.constant = data.value
        self.barView.frame.size.height = data.value
        self.gradient.colors = [
            UIColor(red: 212 / 255, green: 193 / 255, blue: 246 / 255, alpha: 1).cgColor,
            UIColor(red: 155 / 255, green: 186 / 255, blue: 244 / 255, alpha: 0.42).cgColor
        ]
        self.gradient.cornerRadius = 12
        self.barView.layer.addSublayer(gradient)
        self.layoutIfNeeded()
    }
}
