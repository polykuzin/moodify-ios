//
//  MoodChooserView.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 20.04.2022.
//

import UIKit
import CoreTableView

class MoodChooserView: UIView {
    
    @IBOutlet weak var tableView: BaseTableView!
    
    enum ViewState {
        case unhappy(MainMood)
        
        struct MainMood: _MainMood {
            var title: String
            var height: CGFloat
            var moodImage: UIImage?
        }
        
        struct MoodSlider: _MoodSlider {
            var position: Float
            var height: CGFloat
            var onMood: ((Float) -> ())?
        }
        
        struct MoodDescription: _MoodDescription {
            var description: String
            var height: CGFloat
        }
        
        struct Moods: _Moods {
            var moods: [_Mood]
            var height: CGFloat
        }
        
        struct Mood: _Mood {
            var title: String
            var isSelected: Bool = false
        }
        
        struct OnNext: _OnNext {
            var onSelect: (() -> ())?
            var height: CGFloat
        }
    }
    
    public func configure(with state: [State]) {
        self.tableView.viewStateInput = state
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
