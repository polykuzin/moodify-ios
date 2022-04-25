//
//  MainMoodCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 24.04.2022.
//

import UIKit
import CoreTableView

protocol _MainMood: CellData {
    var title: String { get set }
    var moodImage: UIImage? { get set }
}

extension _MainMood {
    
    func prepare(cell: UITableViewCell, for tableView: UITableView, indexPath: IndexPath) {
        guard let cell = cell as? MainMoodCell else { return }
        cell.configure(with: self)
    }
    
    func cell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        tableView.register(MainMoodCell.nib, forCellReuseIdentifier: MainMoodCell.identifire)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainMoodCell.identifire, for: indexPath) as? MainMoodCell
        else { return .init() }
        return cell
    }
}

class MainMoodCell: UITableViewCell {

    @IBOutlet weak var moodTitle: UILabel!
    @IBOutlet weak var moodImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with data: _MainMood) {
        self.moodTitle.text = data.title
        self.moodImage.image = data.moodImage
    }
}
