//
//  MoodSaverView.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 12.05.2022.
//

import UIKit
import CoreTableView

class MoodSaverView: UIView {
    
    @IBOutlet weak var moodBar: MoodBar!
    @IBOutlet private weak var saveButton: UIButton!
    @IBOutlet private weak var tableView: BaseTableView!
    
    struct ViewState {
        
        struct FullState {
            var titleState: NavigationState
            var tableState: [State]
        }
        
        struct NavigationState {
            var title: String
        }
        
        struct MoodTotal: _MoodTotal {
            var image: UIImage?
            var title: String
            var height: CGFloat
        }
        
        struct Feelings: _Feelings {
            var height: CGFloat
            var feelings: [_Mood]
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.moodBar.line = .big
        self.saveButton.layer.cornerRadius = 12
    }
    
    public func configure(with state: ViewState.FullState) {
        self.moodBar.title = state.titleState.title
        self.tableView.viewStateInput = state.tableState
    }
    
    @IBAction func handleSave(_ sender: UIButton) {
        
    }
}
