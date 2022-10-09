//
//  MoodChartCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 17.07.2022.
//

import UIKit
import CoreTableView

protocol _MoodChart: CellData {
    var moods: [Mood] { get }
}

extension _MoodChart {
    
    var height: CGFloat {
        return 383
    }
    
    func prepare(cell: UITableViewCell, for tableView: UITableView, indexPath: IndexPath) {
        guard let cell = cell as? MoodChartCell else { return }
        cell.configure(with: self)
    }
    
    func cell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        tableView.register(MoodChartCell.nib, forCellReuseIdentifier: MoodChartCell.identifire)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MoodChartCell.identifire, for: indexPath) as? MoodChartCell
        else { return .init() }
        return cell
    }
}

class MoodChartCell: UITableViewCell {
    
    @IBOutlet private weak var moodChart: MoodChart!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with data: _MoodChart) {
        self.moodChart.configure(with: data.moods)
    }
}
