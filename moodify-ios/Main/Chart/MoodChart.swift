//
//  MoodChart.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 17.07.2022.
//

import UIKit

class MoodChart: UIView {
    
    @IBOutlet private weak var chartView: UIView!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var chartCollection: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let bundle = Bundle(for: MoodChart.self)
        bundle.loadNibNamed("MoodChart", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        chartView.layer.cornerRadius = 14
        chartCollection.delegate = self
        chartCollection.dataSource = self
        chartCollection.register(BigBarCell.nib, forCellWithReuseIdentifier: BigBarCell.reuseId)
    }
}

extension MoodChart: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BigBarCell.reuseId, for: indexPath) as? BigBarCell
        else { return .init() }
        return cell
    }
}

extension MoodChart: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 28, height: chartCollection.frame.height - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
}
