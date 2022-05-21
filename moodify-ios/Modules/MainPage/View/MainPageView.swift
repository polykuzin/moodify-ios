//
//  MainPageView.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 21.05.2022.
//

import UIKit
import CoreTableView

class MainPageView: UIView {
    
    @IBOutlet private weak var moodBar: MoodBar!
    @IBOutlet private weak var tableView: BaseTableView!
    
    struct ViewState {
        
        struct MainImageText: _MainImageText {
            
        }
        
        struct FullStat: _FullStat {
            var onSelect: (() -> Void)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.moodBar.title = .home
        self.moodBar.line = .medium
        self.moodBar.barType = .main
    }
    
    public func configure(with state: [State]) {
        self.tableView.viewStateInput = state
        self.tableView.shouldUseReload = true
    }
}
