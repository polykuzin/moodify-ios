//
//  SplashController.swift
//  moodify-ios
//
//  Created by polykuzin on 26/03/2022.
//

import UIKit

final class SplashController : BaseController {
    
    @AppStorage(key: "isPrimary", defaultValue: false)
    var isPrimary : Bool
    
    @AppStorage(key: "isOnboarded", defaultValue: false)
    var isOnboarded : Bool
    
    var nestedView = SplashView.loadFromNib()
    
    override func loadView() {
        self.view = nestedView
        let manager = SplashStateManager()
        nestedView.configure(with: manager.makeState())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.handleNavigation()
        }
    }
    
    private func handleNavigation() {
        if !isPrimary {
            // here is the place to configure Adapty manager
        }
        if !isOnboarded {
            let controller = OnBoardingController()
            controller.modalTransitionStyle = .crossDissolve
            controller.modalPresentationStyle = .fullScreen
            let rootController = UIApplication.shared.keyWindow?.rootViewController
            rootController?.present(controller, animated: true)
        }
    }
}
