//
//  MoodBar.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 12.05.2022.
//

import UIKit

class MoodBar: UIView {
    
    enum LineType {
        case small
        case medium
        case big
    }
    
    enum LabelTitle {
        case home
        case moodChoose
        case moodSave(String)
        case settings
    }
    
    enum BarType {
        case main
        case nested
        case emtpy
    }
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var mainTitle: UILabel!
    @IBOutlet private weak var lineImage: UIImageView!
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var streakCountLabel: UILabel!
    
    static var tabBar: UITabBarController?
    static var navigation: UINavigationController?
    
    public var title: LabelTitle = .home {
        didSet {
            switch title {
            case .home:
                self.line = .medium
                self.mainTitle.text = "HOME"
                self.mainTitle.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            case .moodChoose:
                self.line = .medium
                self.mainTitle.text = "How do you feel?"
            case .moodSave(let title):
                self.line = .big
                self.mainTitle.text = title
            case .settings:
                self.line = .medium
                self.mainTitle.text = "Settings"
                self.mainTitle.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            }
        }
    }
    
    public var barType: BarType = .main {
        didSet {
            switch barType {
            case .main:
                self.streakCountLabel.text = "1"
                self.streakCountLabel.isHidden = false
                self.backButton.setImage(.init(named: "left_mood_button"), for: .normal)
            case .nested:
                self.streakCountLabel.isHidden = true
                self.backButton.setImage(.init(named: "back_button"), for: .normal)
            case .emtpy:
                self.backButton.isHidden = true
            }
        }
    }
    
    private var line: LineType = .small {
        didSet {
            switch line {
            case .small:
                self.lineImage.image = .init(named: "small_cherkash")
            case .medium:
                self.lineImage.image = .init(named: "cherkash")
            case .big:
                self.lineImage.image = .init(named: "big_cherkash")
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        let bundle = Bundle(for: MoodBar.self)
        bundle.loadNibNamed("MoodBar", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.backgroundColor = .clear
    }
    
    @IBAction func handleBack(_ sender: UIButton) {
        switch barType {
        case .main:
            print(1)
        case .nested:
            switch title {
            case .home:
                print()
            case .moodChoose:
                guard let tabBar = MoodBar.tabBar else { return }
                tabBar.selectedIndex = 0
            case .moodSave(_):
                guard let navigation = MoodBar.navigation else { return }
                navigation.popViewController(animated: true)
            default:
                print()
            }
        default:
            print()
        }
    }
}
