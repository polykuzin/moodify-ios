//
//  MoodChart.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 17.07.2022.
//

import UIKit

class MoodChart: UIView {
    
    private let converter = MoodConverter()
    private var moods: [ViewState.BigBar] = []
    
    @IBOutlet private weak var chartView: UIView!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var babysStackView: UIStackView!
    @IBOutlet private weak var chartCollection: UICollectionView!
    
    public struct ViewState {
        
        static var weekdays: [String] = ["Mon", "Tue", "Wen", "Thu", "Fri", "Sat", "Sun"]
        
        public struct BigBar: _BigBar {
            var value: CGFloat
            var weekday: String
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
    
    public func configure(with moods: [Mood]) {
        let maxHeight = chartCollection.frame.height - 57
        let values = converter.convertMoodsToWeekdayScale(moods: moods, maxValue: maxHeight)
        for (weekday, value) in zip(ViewState.weekdays, values) {
            let state = ViewState.BigBar(value: value, weekday: String(weekday.first!))
            self.moods.append(state)
        }
        self.chartCollection.reloadData()
    }
}

extension MoodChart: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BigBarCell.reuseId, for: indexPath) as? BigBarCell
        else { return .init() }
        if moods.count != 0 {
            let state = self.moods[indexPath.row]
            cell.configure(with: state)
        }
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
