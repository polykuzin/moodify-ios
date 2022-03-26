//
//  OnBoardingStateManager.swift
//  moodify-ios
//
//  Created by polykuzin on 27/03/2022.
//

import UIKit

final class OnBoardingStateManager {
    
    public func makeState() -> [_Step] {
        struct Step : _Step {
            var title: String
            var descr: String
            var image: UIImage
        }
        let first = Step(
            title: "1st_step_title".localized(using: "OnBoarding"),
            descr: "1st_step_descr".localized(using: "OnBoarding"),
            image: UIImage(named: "1st_step_image")!
        )
        let second = Step(
            title: "2nd_step_title".localized(using: "OnBoarding"),
            descr: "2nd_step_descr".localized(using: "OnBoarding"),
            image: UIImage(named: "2nd_step_image")!
        )
        let third = Step(
            title: "3rd_step_title".localized(using: "OnBoarding"),
            descr: "3rd_step_descr".localized(using: "OnBoarding"),
            image: UIImage(named: "3rd_step_image")!
        )
        return [
            first,
            second,
            third
        ]
    }
}
