//
//  MainPageController.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 21.05.2022.
//

import UIKit

class MainPageController: UIViewController {
    
    let manager = MainPageManager()
    let nestedView = MainPageView.loadFromNib()
    
    override func loadView() {
        self.view = nestedView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.nestedView.configure(with: manager.makeMainPageState())
    }
}
