//
//  MoodSaverView.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 12.05.2022.
//

import UIKit
import CoreTableView

class MoodSaverView: UIView {
    
    var onSave: ((ViewState.FullState?) -> ())?
    
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
        
        struct Photos: _Photos {
            var height: CGFloat
            var photos: [UIImage]
            var addImage: (() -> ())?
        }
    }
    
    var viewState: ViewState.FullState?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.moodBar.line = .big
        self.saveButton.layer.cornerRadius = 12
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
    }
    
    public func configure(with state: ViewState.FullState) {
        self.viewState = state
        self.moodBar.title = .moodSave(state.titleState.title)
        self.tableView.viewStateInput = state.tableState
        self.tableView.shouldUseReload = true
    }
    
    @IBAction func handleSave(_ sender: UIButton) {
        self.onSave?(viewState)
    }
}
