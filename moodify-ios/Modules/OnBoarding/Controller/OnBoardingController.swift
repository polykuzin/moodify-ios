//
//  OnBoardingController.swift
//  moodify-ios
//
//  Created by polykuzin on 26/03/2022.
//

import UIKit

final class OnBoardingController : BaseController {
    
    let nestedView = OnBoardingView.loadFromNib()
    
    override func loadView() {
        self.view = nestedView
        let manager = OnBoardingStateManager()
        nestedView.configure(with: manager.makeState())
    }
}
