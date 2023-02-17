//
//  SettingsView.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 19.06.2022.
//

import UIKit
import CoreTableView

class SettingsView: UIView {
    
    @IBOutlet private weak var moodBar: MoodBar!
    @IBOutlet private weak var tableView: BaseTableView!
    
    struct ViewState {
        
        struct SettingsHeader: _SettingsHeader {
            var title: String
        }
        
        struct Settings: _Settings {
            var title: String
            var hasSeparator: Bool
            var leftImage: UIImage?
            var rightAccessory: SettingsCell.RightAccessory?
            var onItemSelect: Command<Void>
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.moodBar.barType = .emtpy
        self.moodBar.title = .settings
    }
    
    public func configure(with state: [State]) {
        self.tableView.viewStateInput = state
    }
}
