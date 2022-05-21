//
//  FullStatCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 21.05.2022.
//

import UIKit
import CoreTableView

protocol _FullStat: CellData {
    
}

extension _FullStat {
    
    var height: CGFloat {
        return 60
    }
    
    func prepare(cell: UITableViewCell, for tableView: UITableView, indexPath: IndexPath) {
        guard let cell = cell as? FullStatCell else { return }
        cell.configure(with: self)
    }
    
    func cell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        tableView.register(FullStatCell.nib, forCellReuseIdentifier: FullStatCell.identifire)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FullStatCell.identifire, for: indexPath) as? FullStatCell
        else { return .init() }
        return cell
    }
}

class FullStatCell: UITableViewCell {
    
    @IBOutlet private weak var fullStatButton: UIButton!
    
    var onSelect: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.fullStatButton.layer.cornerRadius = 14
    }
    
    public func configure(with data: _FullStat) {
        self.onSelect = data.onSelect
    }
    
    @IBAction func handleFullStat(_ sender: UIButton) {
        self.onSelect?()
    }
}
