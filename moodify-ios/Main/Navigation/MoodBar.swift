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
    }
    
    enum BarType {
        case main
        case nested
    }
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var mainTitle: UILabel!
    @IBOutlet private weak var lineImage: UIImageView!
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var streakCountLabel: UILabel!
    
    var navigation: UINavigationController?
    
    var title: LabelTitle? {
        didSet {
            switch title {
            case .home:
                self.mainTitle.text = "HOME"
                self.mainTitle.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            default:
                print()
            }
        }
    }
    
    var line: LineType = .small {
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
    
    var barType: BarType = .main {
        didSet {
            switch barType {
            case .main:
                self.streakCountLabel.text = "1"
                self.streakCountLabel.isHidden = false
                self.backButton.setImage(.init(named: "left_mood_button"), for: .normal)
            case .nested:
                self.streakCountLabel.isHidden = true
                self.backButton.setImage(.init(named: "back_button"), for: .normal)
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
            guard let navigation = navigation else { return }
            navigation.popViewController(animated: true)
        }
    }
}
