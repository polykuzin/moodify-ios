//
//  MoodChooserView.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 20.04.2022.
//

import UIKit
import CoreTableView

class MoodChooserView: UIView {
    
    var onNext: (() -> ())?
    
    @IBOutlet private weak var moodBar: MoodBar!
    @IBOutlet private weak var tableView: BaseTableView!
    @IBOutlet private weak var mainButton: UIButton!
    
    struct ViewState {
        
        enum MoodType: String {
            case unhappy
            case sad
            case normal
            case good
            case happy
        }
        
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
            var onSelectMood: ((_Mood) -> ())?
            var onRemoveMood: ((_Mood) -> ())?
            var height: CGFloat
        }
        
        struct Mood: _Mood {
            var title: String
        }
    }
    
    public func configure(with state: [State]) {
        self.tableView.viewStateInput = state
        self.tableView.shouldUseReload = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.moodBar.title = .moodChoose
        self.moodBar.line = .medium
        self.mainButton.layer.cornerRadius = 12
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
    }
    
    @IBAction func handleNext(_ sender: UIButton) {
        self.onNext?()
    }
}
