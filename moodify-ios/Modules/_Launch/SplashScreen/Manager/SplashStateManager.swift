//
//  SplashStateManager.swift
//  moodify-ios
//
//  Created by polykuzin on 26/03/2022.
//

import UIKit

final class SplashStateManager {
    
    public func makeState() -> _Splash {
        struct State : _Splash {
            var dialogTitle : String
            var splashTitle : String
            var splashImage : UIImage
        }
        return State(
            dialogTitle: "dialog_title".localized(using: "Splash"),
            splashTitle: "splash_title".localized(using: "Splash"),
            splashImage: UIImage(named: "splash_image") ?? UIImage()
        )
    }
}
