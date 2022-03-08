//
//  DashboardController.swift
//  moodify-ios
//
//  Created by polykuzin on 07/03/2022.
//

import UIKit

final class DashboardController : BaseController {
    
    var nestedView : DashboardView? {
        do {
            return try DashboardView.loadFromNib()
        } catch {
            print(error)
        }
        return nil
    }
    
    override func loadView() {
        self.view = nestedView
    }
}
