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
        
        struct PageState {
            var streak: Int
            var tableState: [State]
        }
        
        struct MainImageText: _MainImageText {
            
        }
        
        struct FullStat: _FullStat {
            var onSelect: (() -> Void)
        }
        
        struct Journal: _Journal {
            
        }
        
        struct DailyMotivation: _DailyMotivation {
            var text: String
            var author: String
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.moodBar.title = .home
        self.moodBar.barType = .main(1)
    }
    
    public func configure(with state: ViewState.PageState) {
        self.moodBar.barType = .main(state.streak)
        self.tableView.viewStateInput = state.tableState
        self.tableView.shouldUseReload = true
    }
}
