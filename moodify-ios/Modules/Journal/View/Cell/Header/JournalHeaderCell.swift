//
//  DistributionHeaderCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 02.07.2022.
//

import UIKit
import CoreTableView

protocol _JournalHeader: HeaderData {
    var title: String { get set }
    var description: String { get set }
}

extension _JournalHeader {
    
    var height: CGFloat {
        return 93
    }
    
    func header(for tableView: UITableView, section: Int) -> UIView? {
        tableView.register(JournalHeaderCell.nib, forHeaderFooterViewReuseIdentifier: JournalHeaderCell.identifire)
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: JournalHeaderCell.identifire) as? JournalHeaderCell else { return nil }
        headerView.configure(with: self)
        return headerView
    }
}

class JournalHeaderCell: UITableViewHeaderFooterView {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with data: _JournalHeader) {
        self.titleLabel.text = data.title
        self.descriptionLabel.text = data.description
    }
}
