//
//  ButtonCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 24.04.2022.
//

import UIKit
import CoreTableView

protocol _OnNext: CellData {
    var onSelect: (() -> ())? { get set }
}

extension _OnNext {
    
    func prepare(cell: UITableViewCell, for tableView: UITableView, indexPath: IndexPath) {
        guard let cell = cell as? ButtonCell else { return }
        cell.configure(with: self)
    }
    
    func cell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        tableView.register(ButtonCell.nib, forCellReuseIdentifier: ButtonCell.identifire)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ButtonCell.identifire, for: indexPath) as? ButtonCell
        else { return .init() }
        return cell
    }
}

class ButtonCell: UITableViewCell {

    @IBOutlet weak var nextButton: UIButton!
    
    var onSelect: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nextButton.layer.cornerRadius = 14
    }
    
    public func configure(with data: _OnNext) {
        self.onSelect = data.onSelect
    }
}
