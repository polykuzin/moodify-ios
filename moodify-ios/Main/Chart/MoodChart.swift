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
    
    public struct ViewState {
        
        public struct BigBar: _BigBar {
            var value: CGFloat
        }
    }
    
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
        let height = CGFloat.random(in: 100...300)
        let barHeight = ViewState.BigBar(value: height)
        cell.configure(with: barHeight)
        return cell
    }
}

extension MoodChart: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = chartView.frame.width * 0.15 - 27
        if collectionView == chartCollection {
            return CGSize(width: width, height: chartCollection.frame.height - 20)
        }
        return CGSize(width: width, height: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
}
