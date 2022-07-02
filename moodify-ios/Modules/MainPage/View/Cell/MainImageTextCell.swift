//
//  MainImageTextCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 21.05.2022.
//

import UIKit
import CoreTableView

protocol _MainImageText: CellData {
    var image: UIImage? { get }
    var title: String { get }
}

extension _MainImageText {
    
    var height: CGFloat {
        return 488
    }
    
    func prepare(cell: UITableViewCell, for tableView: UITableView, indexPath: IndexPath) {
        guard let cell = cell as? MainImageTextCell else { return }
        cell.configure(with: self)
    }
    
    func cell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        tableView.register(MainImageTextCell.nib, forCellReuseIdentifier: MainImageTextCell.identifire)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainImageTextCell.identifire, for: indexPath) as? MainImageTextCell
        else { return .init() }
        return cell
    }
}

class MainImageTextCell: UITableViewCell {
    
    @IBOutlet private weak var mainImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with data: _MainImageText) {
        self.mainImage.image = data.image
        self.titleLabel.text = data.title
    }
}
