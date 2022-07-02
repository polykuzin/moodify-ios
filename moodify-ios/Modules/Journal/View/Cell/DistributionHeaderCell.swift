//
//  DistributionHeaderCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 02.07.2022.
//

import UIKit
import CoreTableView

protocol _DistributionHeader: HeaderData {
    var title: String { get set }
    var description: String { get set }
}

extension _DistributionHeader {
    
    var height: CGFloat {
        return 93
    }
    
    func header(for tableView: UITableView, section: Int) -> UIView? {
        tableView.register(DistributionHeaderCell.nib, forHeaderFooterViewReuseIdentifier: DistributionHeaderCell.identifire)
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: DistributionHeaderCell.identifire) as? DistributionHeaderCell else { return nil }
        headerView.configure(with: self)
        return headerView
    }
}

class DistributionHeaderCell: UITableViewHeaderFooterView {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with data: _DistributionHeader) {
        self.titleLabel.text = data.title
        self.descriptionLabel.text = data.description
    }
}
