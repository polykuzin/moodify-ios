//
//  JournalController.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 02.07.2022.
//

import UIKit

class JournalController: UIViewController {
    
    private let manager = JournalManager()
    private let nestedView = JournalView.loadFromNib()
    
    override func loadView() {
        self.view = nestedView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.nestedView.configure(with: self.manager.makeState())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
}
