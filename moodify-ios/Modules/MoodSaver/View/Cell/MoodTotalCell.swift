//
//  MoodTotalCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 12.05.2022.
//

import UIKit
import CoreTableView

protocol _MoodTotal: CellData {
    var image: UIImage? { get set }
    var title: String { get set }
}

extension _MoodTotal {
    
    func prepare(cell: UITableViewCell, for tableView: UITableView, indexPath: IndexPath) {
        guard let cell = cell as? MoodTotalCell else { return }
        cell.configure(with: self)
    }
    
    func cell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        tableView.register(MoodTotalCell.nib, forCellReuseIdentifier: MoodTotalCell.identifire)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MoodTotalCell.identifire, for: indexPath) as? MoodTotalCell
        else { return .init() }
        return cell
    }
}

class MoodTotalCell: UITableViewCell {

    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with data: _MoodTotal) {
        self.mainTitle.text = data.title
        self.mainImage.image = data.image
    }
}
