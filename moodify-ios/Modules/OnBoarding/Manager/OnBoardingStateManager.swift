//
//  OnBoardingStateManager.swift
//  moodify-ios
//
//  Created by polykuzin on 27/03/2022.
//

import UIKit

final class OnBoardingStateManager {
    
    typealias StepState = OnBoardingView.ViewState
    
    public func makeState() -> [_Step] {
        let first = StepState.FirstStep(
            title: "1st_step_title".localized(using: "OnBoarding"),
            description: "1st_step_descr".localized(using: "OnBoarding")
        )
        let second = StepState.SecondStep(
            title: "2nd_step_title".localized(using: "OnBoarding"),
            description: "2nd_step_descr".localized(using: "OnBoarding")
        )
        let third = StepState.ThirdStep(
            title: "3rd_step_title".localized(using: "OnBoarding"),
            description: "3rd_step_descr".localized(using: "OnBoarding")
        )
        return [first, second, third]
    }
}
