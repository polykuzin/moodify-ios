//
//  MoodCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 21.04.2022.
//

import UIKit
import CoreTableView

protocol _Mood {
    var title: String { get set }
}

class MoodCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    public func configure(with data: _Mood) {
        titleLabel.text = data.title
    }
    
    private func setupCell() {
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 7
        self.layer.borderColor = UIColor.cellText.cgColor
    }
}
