//
//  FeelingsCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 12.05.2022.
//

import UIKit
import CoreTableView

protocol _Feelings: CellData {
    var feelings: [_Mood] { get set }
}

extension _Feelings {
    
    func prepare(cell: UITableViewCell, for tableView: UITableView, indexPath: IndexPath) {
        guard let cell = cell as? FeelingsCell else { return }
        cell.configure(with: self)
    }
    
    func cell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        tableView.register(FeelingsCell.nib, forCellReuseIdentifier: FeelingsCell.identifire)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeelingsCell.identifire, for: indexPath) as? FeelingsCell
        else { return .init() }
        return cell
    }
}

class FeelingsCell: UITableViewCell {

    @IBOutlet private weak var emptyTitle: UILabel!
    @IBOutlet private weak var moodCollection: UICollectionView!
    @IBOutlet private weak var collectionLayout: UICollectionViewFlowLayout!
    @IBOutlet private weak var collectionViewHeight: NSLayoutConstraint!
    
    var moods: [_Mood] = [] {
        didSet {
            if moods.isEmpty {
                emptyTitle.isHidden = false
                moodCollection.isHidden = true
            } else {
                emptyTitle.isHidden = true
                moodCollection.isHidden = false
                if moods.count > 3 {
                    self.moodCollection.reloadData()
                    let rows = CGFloat(moods.count / 3) + 1
                    let height = rows * 37 + CGFloat((moods.count / 3) * 15)
                    self.collectionViewHeight.constant = height
                    self.layoutIfNeeded()
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        self.moodCollection.delegate = self
        self.moodCollection.dataSource = self
        self.moodCollection.register(MoodCell.nib, forCellWithReuseIdentifier: MoodCell.reuseId)
    }
    
    public func configure(with data: _Feelings) {
        self.moods = data.feelings
    }
}

extension FeelingsCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoodCell.reuseId, for: indexPath) as? MoodCell
        else { return .init() }
        cell.configure(with: moods[indexPath.row])
        cell.makeSelected()
        return cell
    }
}

extension FeelingsCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.moodCollection.frame.width / 3.2
        return CGSize(width: width, height: 37)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
