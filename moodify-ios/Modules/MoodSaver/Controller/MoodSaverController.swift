//
//  MoodSaverController.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 12.05.2022.
//

import UIKit

class MoodSaverController: UIViewController {
    
    let nestedView = MoodSaverView.loadFromNib()
    let manager = MoodSaverManager()
    
    var moods: [_Mood] = []
    
    override func loadView() {
        self.view = nestedView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.nestedView.configure(with: manager.makeState(with: moods))
    }
    
    private func setupView() {
        self.navigationItem.hidesBackButton = true
        self.nestedView.moodBar.navigation = self.navigationController
    }
}
