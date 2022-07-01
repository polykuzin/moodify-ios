//
//  SceneDelegate.swift
//  moodify-ios
//
//  Created by polykuzin on 07/03/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        let showOnBoarding = UserDefaults.standard.bool(forKey: "first_run")
        if !showOnBoarding {
            let rootVC = OnBoardingController()
            window?.rootViewController = rootVC
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let rootVC = storyboard.instantiateViewController(identifier: "Main") as? MoodTabBarController
            else { return }
            window?.rootViewController = rootVC
        }
        window?.makeKeyAndVisible()
    }
}
