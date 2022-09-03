//
//  OnBoardingController.swift
//  moodify-ios
//
//  Created by polykuzin on 26/03/2022.
//

import UIKit
import UserNotifications

final class OnBoardingController : BaseController {
    
    let nestedView = OnBoardingView.loadFromNib()
    
    override func loadView() {
        self.view = nestedView
        let manager = OnBoardingStateManager()
        self.nestedView.onAllowNotifications = { [weak self] in
            guard let self = self else { return }
            self.requestNotifications()
        }
        self.nestedView.onFirstRun = { [weak self] in
            guard let self = self else { return }
            UserDefaults.standard.set(true, forKey: "first_run")
        }
        self.nestedView.configure(with: manager.makeState())
    }
    
    private func requestNotifications() {
        let notificationCenter = UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        notificationCenter.requestAuthorization(options: options) { (didAllow, error) in
            if didAllow {
                print("Уведомления круто!")
            }
        }
    }
}
