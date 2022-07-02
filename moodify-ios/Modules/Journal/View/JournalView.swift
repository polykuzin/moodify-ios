//
//  JournalView.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 02.07.2022.
//

import UIKit
import CoreTableView

class JournalView: UIView {
    
    @IBOutlet weak var moodBar: MoodBar!
    @IBOutlet weak var tableView: BaseTableView!
    
    struct ViewState {
        
        struct DistributionHeader: _DistributionHeader {
            var title: String
            var description: String
        }
        
        struct Distribution: _Distribution {
            var distributions: [_MoodStat]
        }
        
        struct MoodStat: _MoodStat {
            var image: UIImage?
            var title: String
            var distribution: Int
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.moodBar.title = .statistic
        self.moodBar.barType = .nested
    }
    
    public func configure(with state: [State]) {
        self.tableView.viewStateInput = state
    }
}
