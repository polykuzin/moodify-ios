//
//  MainImageTextCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 21.05.2022.
//

import UIKit
import CoreTableView

protocol _MainImageText: CellData {
    
}

extension _MainImageText {
    
    var height: CGFloat {
        return 511
    }
    
    func cell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        tableView.register(MainImageTextCell.nib, forCellReuseIdentifier: MainImageTextCell.identifire)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainImageTextCell.identifire, for: indexPath) as? MainImageTextCell
        else { return .init() }
        return cell
    }
}

class MainImageTextCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
