//
//  MoodTabBarController.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 15.06.2022.
//

import UIKit

class MoodTabBarController: UITabBarController {
    
    private let plusButtonHeight: Float = 94

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarItems()
        setupTabBarDesign()
    }
}

extension UIWindow {
    
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}

extension MoodTabBarController {
    
    private func setupTabBarItems() {
        let homeController = MainPageController()
        homeController.tabBarItem = UITabBarItem(title: "HOME", image: .init(named: "home_button"), tag: 0)
        
        let navigation = MoodNavigationController(rootViewController: MoodChooserController())
        MoodBar.navigation = navigation
        MoodBar.tabBar = self
        let moodController = navigation
        moodController.tabBarItem = UITabBarItem(title: nil, image: .init(named: "add_button_unselected"), selectedImage: .init(named: "add_button_selected"))
        
        let settingsController = SettingsController()
        settingsController.tabBarItem = UITabBarItem(title: "SETTINGS", image: .init(named: "settings_button"), tag: 2)
        
        viewControllers = [homeController, moodController, settingsController]
    }
    
    private func setupTabBarDesign() {
        self.tabBar.backgroundColor = .base
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .black
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10, weight: .regular)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10, weight: .bold)], for: .selected)
        
        UIBarButtonItem.appearance().setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black,
        ],
        for: .normal)
    }
}
