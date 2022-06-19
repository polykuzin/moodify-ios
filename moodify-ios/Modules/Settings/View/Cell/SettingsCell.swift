//
//  SettingsCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 19.06.2022.
//

import UIKit
import CoreTableView

protocol _Settings: CellData {
    var leftImage: UIImage? { get set }
    var title: String { get set }
    var hasSeparator: Bool { get set }
    var rightAccessory: SettingsCell.RightAccessory? { get set }
}

extension _Settings {
    
    var height: CGFloat {
        return 60
    }
    
    func prepare(cell: UITableViewCell, for tableView: UITableView, indexPath: IndexPath) {
        guard let cell = cell as? SettingsCell else { return }
        cell.configure(with: self)
    }
    
    func cell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        tableView.register(SettingsCell.nib, forCellReuseIdentifier: SettingsCell.identifire)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.identifire, for: indexPath) as? SettingsCell
        else { return .init() }
        return cell
    }
}

class SettingsCell: UITableViewCell {
    
    enum RightAccessory {
        case switcher
        case timePicker
        case unlockLabel
    }
    
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var switcher: UISwitch!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var unlockLabel: UILabel!
    @IBOutlet private weak var leftImage: UIImageView!
    @IBOutlet private weak var separatorView: UIView!
    @IBOutlet private weak var withImage: NSLayoutConstraint!
    @IBOutlet private weak var withoutImage: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with data: _Settings) {
        self.titleLabel.text = data.title
        if let image = data.leftImage {
            self.leftImage.image = image
            self.withImage.priority = .defaultHigh
            self.withoutImage.priority = .defaultLow
        } else {
            self.withImage.priority = .defaultLow
            self.withoutImage.priority = .defaultHigh
        }
        if data.hasSeparator {
            self.separatorView.isHidden = false
        } else {
            self.separatorView.isHidden = true
        }
        if let accessory = data.rightAccessory {
            switch accessory {
            case .timePicker:
                self.timeLabel.isHidden = false
                self.timeLabel.text = "11:20"
                self.switcher.isHidden = true
                self.unlockLabel.isHidden = true
            case .switcher:
                self.switcher.isHidden = false
                self.timeLabel.isHidden = true
                self.unlockLabel.isHidden = true
            case .unlockLabel:
                self.unlockLabel.isHidden = false
                self.timeLabel.isHidden = true
                self.switcher.isHidden = true
            }
        } else {
            self.switcher.isHidden = true
            self.timeLabel.isHidden = true
            self.unlockLabel.isHidden = true
        }
    }
}
