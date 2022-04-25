//
//  MoodChooserController.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 20.04.2022.
//

import UIKit

class MoodChooserController: UIViewController {
    
    let nestedView = MoodChooserView.loadFromNib()
    
    override func loadView() {
        self.view = nestedView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let manager = MoodChooserManager()
        self.nestedView.configure(with: manager.makeUnhappyState())
    }
}
