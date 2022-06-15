//
//  DailyMotivationCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 22.05.2022.
//

import UIKit
import CoreTableView

protocol _DailyMotivation: CellData {
    var author: String { get set }
    var text: String { get set }
}

extension _DailyMotivation {
    
    var height: CGFloat {
        return 226
    }
    
    func prepare(cell: UITableViewCell, for tableView: UITableView, indexPath: IndexPath) {
        guard let cell = cell as? DailyMotivationCell else { return }
        cell.configure(with: self)
    }
    
    func cell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        tableView.register(DailyMotivationCell.nib, forCellReuseIdentifier: DailyMotivationCell.identifire)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DailyMotivationCell.identifire, for: indexPath) as? DailyMotivationCell
        else { return .init() }
        return cell
    }
}

class DailyMotivationCell: UITableViewCell {
    
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var motivationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cardView.layer.cornerRadius = 14
    }
    
    public func configure(with data: _DailyMotivation) {
        self.authorLabel.text = data.author
        self.motivationLabel.text = data.text
    }
}
