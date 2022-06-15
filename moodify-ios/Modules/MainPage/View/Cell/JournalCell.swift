//
//  JournalCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 22.05.2022.
//

import UIKit
import CoreTableView

protocol _Journal: CellData {
    
}

extension _Journal {
    
    var height: CGFloat {
        return 175
    }
    
    func cell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        tableView.register(JournalCell.nib, forCellReuseIdentifier: JournalCell.identifire)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: JournalCell.identifire, for: indexPath) as? JournalCell
        else { return .init() }
        return cell
    }
}

class JournalCell: UITableViewCell {
    
    @IBOutlet private weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cardView.layer.cornerRadius = 14
    }
}
