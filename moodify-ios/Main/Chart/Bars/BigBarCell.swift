//
//  BigBarCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 17.07.2022.
//

import UIKit

protocol _BigBar {
    var value: CGFloat { get }
}

class BigBarCell: UICollectionViewCell {

    @IBOutlet private weak var barView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let gradient = CAGradientLayer()
        gradient.frame = barView.bounds
        gradient.colors = [
            UIColor(red: 212 / 255, green: 193 / 255, blue: 246 / 255, alpha: 1),
            UIColor(red: 155 / 255, green: 186 / 255, blue: 244 / 255, alpha: 0.42)
        ]
        barView.layer.insertSublayer(gradient, at: 0)
        barView.layer.cornerRadius = 12
    }
}
