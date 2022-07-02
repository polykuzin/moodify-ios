//
//  MoodDistributionCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 02.07.2022.
//

import UIKit

protocol _MoodStat {
    var image: UIImage? { get }
    var title: String { get }
    var distribution: Int { get }
}

class MoodDistributionCell: UICollectionViewCell {
    
    @IBOutlet private weak var moodImage: UIImageView!
    @IBOutlet private weak var moodTitle: UILabel!
    @IBOutlet private weak var moodDistribution: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with data: _MoodStat) {
        self.moodImage.image = data.image
        self.moodTitle.text = data.title
        self.moodDistribution.text = "\(data.distribution)%"
    }
}
