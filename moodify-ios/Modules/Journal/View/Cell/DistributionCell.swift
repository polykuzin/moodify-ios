//
//  DistributionCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 02.07.2022.
//

import UIKit
import CoreTableView

protocol _Distribution: CellData {
    var distributions: [_MoodStat] { get }
}

extension _Distribution {
    
    var height: CGFloat {
        return 631
    }
    
    func prepare(cell: UITableViewCell, for tableView: UITableView, indexPath: IndexPath) {
        guard let cell = cell as? DistributionCell else { return }
        cell.configure(with: self)
    }
    
    func cell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        tableView.register(DistributionCell.nib, forCellReuseIdentifier: DistributionCell.identifire)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DistributionCell.identifire, for: indexPath) as? DistributionCell
        else { return .init() }
        return cell
    }
}

class DistributionCell: UITableViewCell {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var distributions: [_MoodStat] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(MoodDistributionCell.nib, forCellWithReuseIdentifier: MoodDistributionCell.reuseId)
    }
    
    public func configure(with data: _Distribution) {
        self.distributions = data.distributions
    }
}

extension DistributionCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return distributions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoodDistributionCell.reuseId, for: indexPath) as? MoodDistributionCell
        else { return .init() }
        cell.configure(with: distributions[indexPath.row])
        return cell
    }
}

extension DistributionCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 207)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 36
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
