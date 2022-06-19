//
//  SettingsController.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 19.06.2022.
//

import UIKit

class SettingsController: UIViewController {
    
    let manager = SettingsManager()
    let nestedView = SettingsView.loadFromNib()
    
    override func loadView() {
        self.view = nestedView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.nestedView.configure(with: manager.makeSettingsState())
    }
}
