//
//  MoodDescriptionCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 24.04.2022.
//

import UIKit
import CoreTableView

protocol _MoodDescription: CellData {
    var description: String { get set }
}

extension _MoodDescription {
    
    func prepare(cell: UITableViewCell, for tableView: UITableView, indexPath: IndexPath) {
        guard let cell = cell as? MoodDescriptionCell else { return }
        cell.configure(with: self)
    }
    
    func cell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        tableView.register(MoodDescriptionCell.nib, forCellReuseIdentifier: MoodDescriptionCell.identifire)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MoodDescriptionCell.identifire, for: indexPath) as? MoodDescriptionCell
        else { return .init() }
        return cell
    }
}

class MoodDescriptionCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with data: _MoodDescription) {
        self.descriptionLabel.text = data.description
    }
}
