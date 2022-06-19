//
//  SettingsHeader.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 19.06.2022.
//

import UIKit
import CoreTableView

protocol _SettingsHeader: HeaderData {
    var title: String { get set }
}

extension _SettingsHeader {
    
    var height: CGFloat {
        return 30
    }
    
    func header(for tableView: UITableView, section: Int) -> UIView? {
        tableView.register(SettingsHeaderCell.nib, forHeaderFooterViewReuseIdentifier: SettingsHeaderCell.identifire)
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: SettingsHeaderCell.identifire) as? SettingsHeaderCell else { return nil }
        headerView.configure(with: self)
        return headerView
    }
}

class SettingsHeaderCell: UITableViewHeaderFooterView {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with data: _SettingsHeader) {
        self.titleLabel.text = data.title
    }
}
