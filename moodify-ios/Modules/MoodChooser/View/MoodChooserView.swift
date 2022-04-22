//
//  MoodChooserView.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 20.04.2022.
//

import UIKit

class MoodChooserView: UIView {
    
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var babyImage: UIImageView!
    @IBOutlet private weak var babyMoodLabel: UILabel!
    @IBOutlet private weak var moodCollection: UICollectionView!
    @IBOutlet private weak var moodCollectionLayout: UICollectionViewFlowLayout!
    
    enum ViewState {
        case initial
        case unhappy([Mood])
        case sad([Mood])
        case normal([Mood])
        case good([Mood])
        case happy([Mood])
        
        struct Mood: _Mood {
            var title: String
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private var viewState: ViewState = .initial {
        didSet {
            self.moodCollection.reloadData()
        }
    }
    
    public func configure(with state: ViewState) {
        self.viewState = state
    }
    
    private func setupView() {
        moodCollection.dataSource = self
        moodCollectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        nextButton.layer.cornerRadius = 14
        moodCollection.register(MoodCell.nib, forCellWithReuseIdentifier: MoodCell.reuseId)
    }
}

extension MoodChooserView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch viewState {
        case .initial:
            return 0
        case .unhappy(let moods), .sad(let moods), .normal(let moods), .good(let moods), .happy(let moods):
            return moods.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoodCell.reuseId, for: indexPath) as? MoodCell
        else { return .init() }
        switch viewState {
        case .initial:
            return .init()
        case .unhappy(let moods), .sad(let moods), .normal(let moods), .good(let moods), .happy(let moods):
            cell.configure(with: moods[indexPath.row])
        }
        return cell
    }
}
