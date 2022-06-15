//
//  MoodTabBar.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 15.06.2022.
//

import UIKit

class MoodTabBar: UITabBar {
    
    override func draw(_ rect: CGRect) {
        self.backgroundColor = .base
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard !clipsToBounds && !isHidden && alpha > 0 else { return nil }
        for member in subviews.reversed() {
            let subPoint = member.convert(point, from: self)
            guard let result = member.hitTest(subPoint, with: event) else { continue }
            return result
        }
        return nil
    }
}
