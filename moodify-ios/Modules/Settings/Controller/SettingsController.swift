//
//  SettingsController.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 19.06.2022.
//

import UIKit

class SettingsController: UIViewController {
    
    var manager: SettingsManager?
    let nestedView = SettingsView.loadFromNib()
    
    init() {
        super.init(nibName: "SettingsController", bundle: nil)
        self.manager = SettingsManager(controller: self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func loadView() {
        self.view = nestedView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if let manager {
            self.nestedView.configure(with: manager.makeSettingsState())
        }
    }
}
