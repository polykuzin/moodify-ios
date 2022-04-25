//
//  SliderCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 24.04.2022.
//

import UIKit
import CoreTableView

protocol _MoodSlider: CellData {
    var position: Int { get set }
}

extension _MoodSlider {
    
    func prepare(cell: UITableViewCell, for tableView: UITableView, indexPath: IndexPath) {
        guard let cell = cell as? SliderCell else { return }
        cell.configure(with: self)
    }
    
    func cell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        tableView.register(SliderCell.nib, forCellReuseIdentifier: SliderCell.identifire)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SliderCell.identifire, for: indexPath) as? SliderCell
        else { return .init() }
        return cell
    }
}

class SliderCell: UITableViewCell {

    @IBOutlet weak var moodSlider: UISlider!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with data: _MoodSlider) {
        
    }
}
