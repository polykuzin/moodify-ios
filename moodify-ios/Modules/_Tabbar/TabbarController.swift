//
//  TabbarController.swift
//  moodify-ios
//
//  Created by polykuzin on 07/03/2022.
//

import UIKit

final class TabbarController : UITabBarController {
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.setupControllers()
        self.setupTabbarTitles()
        self.setupLocalization()
        self.setupTabbarDesign()
    }
    
    @objc
    private func setupTabbarTitles() {
        if let items = self.tabBar.items {
            for (index, item) in items.enumerated() {
                switch index {
                case 0 :
                    item.title = "tabbar_0".localized(using: "Tabbar")
                    
                default:
                    item.title = "tabbar_1".localized(using: "Tabbar")
                }
            }
        }
    }
    
    private func setupControllers() {
        self.viewControllers = []
    }
    
    private func setupLocalization() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.setupTabbarTitles),
            name: NSNotification.Name(LCLLanguageChangeNotification),
            object: nil
        )
    }
    
    private func setupTabbarDesign() {
//        self.view.backgroundColor = .tabbar
//        let tabbarAppearance = UITabBarAppearance()
//        self.tabBar.tintColor = .main
//        self.tabBar.backgroundColor = .tabbar
//        self.tabBar.standardAppearance = tabbarAppearance
//        self.tabBar.unselectedItemTintColor = .textSecondary
//        UITabBarItem.appearance().setTitleTextAttributes(
//            [
//                NSAttributedString.Key.font : UIFont.tabbar,
//                NSAttributedString.Key.foregroundColor : UIColor.textSecondary
//            ],
//            for: .normal
//        )
//        UITabBarItem.appearance().setTitleTextAttributes(
//            [
//                NSAttributedString.Key.font : UIFont.tabbar,
//                NSAttributedString.Key.foregroundColor : UIColor.main
//            ],
//            for: .selected
//        )
    }
}
