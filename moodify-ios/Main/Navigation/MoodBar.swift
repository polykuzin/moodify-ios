//
//  MoodBar.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 12.05.2022.
//

import UIKit

class MoodBar: UIView {
    
    enum lineType {
        case small
        case big
    }
    
    @IBOutlet var contentView: UIView!
    @IBOutlet private weak var mainTitle: UILabel!
    @IBOutlet private weak var lineImage: UIImageView!
    
    var navigation: UINavigationController?
    
    var title: String? {
        didSet {
            self.mainTitle.text = title
        }
    }
    
    var line: lineType = .small {
        didSet {
            switch line {
            case .small:
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
    }
    
    @IBAction func handleBack(_ sender: UIButton) {
        guard let navigation = navigation else { return }
        navigation.popViewController(animated: true)
    }
}
