//
//  MoodsCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 24.04.2022.
//

import UIKit
import CoreTableView

protocol _Moods: CellData {
    var moods: [_Mood] { get set }
    var onSelectMood: ((_Mood) -> ())? { get set }
    var onRemoveMood: ((_Mood) -> ())? { get set }
}

extension _Moods {
    
    func prepare(cell: UITableViewCell, for tableView: UITableView, indexPath: IndexPath) {
        guard let cell = cell as? MoodsCell else { return }
        cell.configure(with: self)
    }
    
    func cell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        tableView.register(MoodsCell.nib, forCellReuseIdentifier: MoodsCell.identifire)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MoodsCell.identifire, for: indexPath) as? MoodsCell
        else { return .init() }
        return cell
    }
}

class MoodsCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout!
    
    private var viewState: [_Mood] = [] {
        didSet {
            self.collectionView.reloadData()
            let rows = CGFloat(viewState.count / 3) + 1
            let height = rows * 37 + CGFloat((viewState.count / 3) * 11)
            self.collectionViewHeight.constant = height
            self.layoutIfNeeded()
        }
    }
    
    var selectedMoods: [_Mood] = []
    var onSelectMood: ((_Mood) -> ())?
    var onRemoveMood: ((_Mood) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    public func configure(with data: _Moods) {
        self.viewState = data.moods
        self.onSelectMood = data.onSelectMood
        self.onRemoveMood = data.onRemoveMood
    }
    
    private func setupView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.allowsMultipleSelection = true
        self.collectionView.register(MoodCell.nib, forCellWithReuseIdentifier: MoodCell.reuseId)
    }
}

extension MoodsCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewState.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoodCell.reuseId, for: indexPath) as? MoodCell
        else { return .init() }
        cell.configure(with: viewState[indexPath.row])
        return cell
    }
}

extension MoodsCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedMoods.append(viewState[indexPath.row])
        self.onSelectMood?(viewState[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        self.selectedMoods.removeAll { $0.title == viewState[indexPath.row].title }
        self.onRemoveMood?(viewState[indexPath.row])
    }
}

extension MoodsCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.collectionView.frame.width / 3.2
        return CGSize(width: width, height: 37)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
