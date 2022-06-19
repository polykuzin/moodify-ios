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
        self.moodBar.barType = .main
        
        self.insetsLayoutMarginsFromSafeArea = false
    
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [
            UIColor(red: 248 / 255, green: 251 / 255, blue: 255 / 255, alpha: 1).cgColor,
            UIColor(red: 236 / 255, green: 242 / 255, blue: 255 / 255, alpha: 1).cgColor,
            UIColor(red: 234 / 255, green: 240 / 255, blue: 255 / 255, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)

        let backgroundView = UIView(frame: self.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)

        self.insertSubview(backgroundView, at: 0)
    }
    
    public func configure(with state: [State]) {
        self.tableView.viewStateInput = state
        self.tableView.shouldUseReload = true
    }
}
